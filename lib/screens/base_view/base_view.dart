// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/screens/base_view/widget/header/animated_top_container.dart';

import '../../bloc/footer_bloc/footer_bloc.dart';
import '../../bloc/headers_bloc/headers_bloc.dart';
import '../../bloc/home-bloc/home_state.dart';
import '../../core/utils/styles/app_colors.dart';
import 'widget/chat_bot_widget.dart';
import 'widget/header/header_screen.dart';

class BaseView extends StatefulWidget {
  final Widget child;
  const BaseView({super.key, required this.child});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HeadersBloc>().add(const GetHeaderDataEvent());
      context.read<HeadersBloc>().add(const GetHeaderLoadingEvent());
      context.read<FooterBloc>().add(const GetFooterEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Constants.height = MediaQuery.of(context).size.height;
    Constants.width = MediaQuery.of(context).size.width;
    Constants.desktopBreakPoint =
        Constants.width > 1950 ? 1850 : Constants.width - 100;

    final headerKey = GlobalKey();
    final animatedTopContainerKey = GlobalKey();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SizedBox(
        width: Constants.width,
        child: BlocBuilder<HeadersBloc, HeadersState>(
          builder: (context, headerstate) {
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return ResponsiveBuilder(builder: (
                  context,
                  sizingInformation,
                ) {
                  if (sizingInformation.isMobile) {
                    return Stack(
                      children: [
                        Column(
                          children: [
                            if (state.isTopContainerVisible)
                              AnimatedTopContainer(),
                            HeaderScreen(),
                            Expanded(child: widget.child),
                          ],
                        ),

                        //!-------------(chat bot section)
                        Positioned(
                          right: getValueForScreenType<double>(
                            context: context,
                            mobile: 30,
                            tablet: 50,
                            desktop: 100,
                          ),
                          bottom: 50,
                          child: ChatBotWidget(),
                        ),
                      ],
                    );
                  }
                  return Stack(
                    children: [
                      Column(
                        children: [
                          FutureBuilder(
                              future: Future.delayed(
                                Duration.zero,
                                () => (
                                  headerKey.currentContext?.size,
                                  animatedTopContainerKey.currentContext?.size
                                ),
                              ),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final sizes = snapshot.data as (Size, Size?);
                                  return SizedBox(
                                      height: sizes.$1.height +
                                          (sizes.$2?.height ?? 0));
                                }
                                return SizedBox(height: 100);
                              }),
                          Expanded(child: widget.child),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (state.isTopContainerVisible)
                              AnimatedTopContainer(
                                key: animatedTopContainerKey,
                              ),
                            HeaderScreen(
                              key: headerKey,
                            ),
                          ],
                        ),
                      ),
                      //!-------------(chat bot section)
                      Positioned(
                        right: getValueForScreenType<double>(
                          context: context,
                          mobile: 30,
                          tablet: 50,
                          desktop: 100,
                        ),
                        bottom: 50,
                        child: ChatBotWidget(),
                      ),
                    ],
                  );
                });
              },
            );
          },
        ),
      ),
    );
  }
}
