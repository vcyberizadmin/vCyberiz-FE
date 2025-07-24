// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';
import 'package:vcyberiz/screens/base_view/widget/header/animated_top_container.dart';

import '../../bloc/footer_bloc/footer_bloc.dart';
import '../../bloc/headers_bloc/headers_bloc.dart';
import '../../bloc/home-bloc/home_state.dart';
import 'widget/chat_bot_widget.dart';
import 'widget/header/header_screen.dart';

class BaseView extends StatefulWidget {
  final Widget child;
  const BaseView({super.key, required this.child});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  bool showCookieConsent = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<HeadersBloc>().add(const GetHeaderDataEvent());
      context.read<HeadersBloc>().add(const GetHeaderLoadingEvent());
      context.read<FooterBloc>().add(const GetFooterEvent());

      final prefs = await SharedPreferences.getInstance();
      final isFirstOpen = prefs.getBool('isFirstOpen') ?? true;
      if (isFirstOpen) {
        setState(() => showCookieConsent = true);
      }
    });
  }

  void handleConsent(bool accepted) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstOpen', false);
    setState(() => showCookieConsent = false);
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
                return ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    Widget content = Column(
                      children: [
                        FutureBuilder(
                          future: Future.delayed(
                            Duration.zero,
                            () => (
                              headerKey.currentContext?.size,
                              animatedTopContainerKey.currentContext?.size,
                            ),
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final sizes = snapshot.data as (Size, Size?);
                              return SizedBox(
                                height:
                                    sizes.$1.height + (sizes.$2?.height ?? 0),
                              );
                            }
                            return SizedBox(height: 100);
                          },
                        ),
                        Expanded(child: widget.child),
                      ],
                    );

                    Widget header = Positioned(
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
                          if (showCookieConsent) _cookieConsentBanner(),
                        ],
                      ),
                    );

                    return Stack(
                      children: [
                        if (showCookieConsent)
                          AbsorbPointer(
                            absorbing: true,
                            child: content,
                          )
                        else
                          content,
                        header,
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 80,
                          child: ChatBotWidget(),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _cookieConsentBanner() {
    return Container(
      width: Constants.width,
      color: AppColors.white,
      child: Center(
        child: SizedBox(
          width: getValueForScreenType(
              context: context,
              mobile: Constants.width * .92,
              tablet: Constants.width * .92,
              desktop: Constants.desktopBreakPoint),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kStyle.med(
                text: 'About Cookies on The Site',
                size: getValueForScreenType(
                  context: context,
                  mobile: 20,
                  tablet: 25,
                  desktop: 35,
                ),
                color: AppColors.black,
              ),
              Gap(15),
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                    fontFamily: Constants.font,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          'In order to provide you with the most relevant content and best browser experience we use cookies to remember and store information about how use our website. See how we use this information in our ',
                    ),
                    TextSpan(
                      text: 'Privacy Notice',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.orange,
                        fontFamily: Constants.font,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.orange,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.goNamed(RouteConstants.privacyPath);
                        },
                    ),
                    const TextSpan(text: ' and more information in our '),
                    TextSpan(
                      text: 'Cookie Notice',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.orange,
                        fontFamily: Constants.font,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.orange,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.goNamed(RouteConstants.cookiesPath);
                        },
                    ),
                  ],
                ),
              ),
              Gap(15),
              Row(
                children: [
                  CustomButtonWidget(
                    text: 'Accept',
                    onTap: () => handleConsent(true),
                  ),
                  Gap(10),
                  OutlinedButton(
                    onPressed: () => handleConsent(false),
                    child: Text('Reject'),
                  ),
                ],
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
