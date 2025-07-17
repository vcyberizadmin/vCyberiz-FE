// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/cookies_bloc/cookies_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/bloc/home-bloc/home_state.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/screens/base_view/base_view.dart';
import 'package:vcyberiz/screens/cookie_policy/widgets/header_widget.dart';
import 'package:vcyberiz/screens/cookie_policy/widgets/policy_page.dart';
import 'package:vcyberiz/screens/cookie_policy/widgets/table_of_content.dart';

import '../base_view/widget/footer/footer_screen.dart';

class CookiePolicy extends StatefulWidget {
  const CookiePolicy({super.key});

  @override
  State<CookiePolicy> createState() => _CookiePolicyState();
}

class _CookiePolicyState extends State<CookiePolicy> {
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;
  List<String> sectionOrder = [];
  Map<String, GlobalKey> sectionKeys = {};
  final tocKey = GlobalKey();
  final hasScrolledToEnd = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    context.read<CookiesBloc>().add(const GetCookiesDataEvent());
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    for (int i = 0; i < sectionOrder.length; i++) {
      final key = sectionKeys[sectionOrder[i]];
      if (key?.currentContext != null) {
        final box = key!.currentContext!.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        if (position >= 0 && position <= 200) {
          setState(() {
            selectedIndex = i;
          });
          break;
        }
      }
    }

    final isVisible = _scrollController.offset <= 70;
    hasScrolledToEnd.value =
        _scrollController.offset >= _scrollController.position.maxScrollExtent;
    context.read<HomeBloc>().add(ToggleIsTopContainerVisible(isVisible));
  }

  void scrollToSection(GlobalKey key) {
    final contextTarget = key.currentContext;
    if (contextTarget != null) {
      final box = contextTarget.findRenderObject() as RenderBox;
      final offset =
          box.localToGlobal(Offset.zero).dy + _scrollController.offset;

      _scrollController.animateTo(
        offset - 100, // scroll with 100px padding from top
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: BlocBuilder<CookiesBloc, CookiesState>(
        builder: (context, state) {
          final cookiesList = state.data?.cookiesContent ?? [];

          final Map<String, GlobalKey> sectionKeys = {
            for (var item in cookiesList)
              (item.secHeader ?? '').toLowerCase().replaceAll(' ', '_'):
                  GlobalKey()
          };

          return ResponsiveBuilder(builder: (context, sizingInformation) {
            if (sizingInformation.isDesktop) {
              return BlocBuilder<HomeBloc, HomeState>(
                builder: (context, homeState) {
                  return Stack(
                    children: [
                      Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: Constants.desktopBreakPoint),
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                controller: _scrollController,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FutureBuilder(
                                      future: Future.delayed(
                                        Duration.zero,
                                        () =>
                                            tocKey.currentContext?.size?.width,
                                      ),
                                      builder: (context, snapshot) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              right:
                                                  180 + (snapshot.data ?? 0)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Gap(60),
                                              const HeaderWidget(),
                                              const Gap(40),
                                              PolicyPoints(
                                                sectionKeys: sectionKeys,
                                                cookiesList: cookiesList,
                                              ),
                                              const Gap(450),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              // RIGHT: Floating Table of Contents
                              Positioned(
                                top: homeState.isTopContainerVisible ? 160 : 40,
                                right: 0,
                                child: TableOfContentsWidget(
                                  key: tocKey,
                                  items: cookiesList,
                                  sectionKeys: sectionKeys,
                                  currentIndex: state.index,
                                  onTapSection: scrollToSection,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: ValueListenableBuilder(
                              valueListenable: hasScrolledToEnd,
                              builder: (context, value, child) {
                                return Visibility(
                                  visible: value,
                                  child: const FooterScreen(),
                                );
                              })),
                    ],
                  );
                },
              );
            } else {
              return SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: Constants.width * .92,
                        child: Column(
                          children: [
                            HeaderWidget(),
                            Gap(sizingInformation.isTablet ? 40 : 24),
                            TableOfContentsWidget(
                              items: cookiesList,
                              sectionKeys: sectionKeys,
                              currentIndex: state.index,
                              onTapSection: scrollToSection,
                            ),
                            Gap(sizingInformation.isTablet ? 40 : 24),
                            PolicyPoints(
                              sectionKeys: sectionKeys,
                              cookiesList: cookiesList,
                            ),
                            Gap(10),
                          ],
                        )),
                    const FooterScreen(),
                  ],
                ),
              );
            }
          });
        },
      ),
    );
  }
}
