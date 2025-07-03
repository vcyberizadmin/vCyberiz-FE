// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/footer_bloc/footer_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../../core/utils/constants/constants.dart';
import '../../../../data/model/footer_model/footer_model.dart';
import '../../../../routes/route_constants.dart';
import 'footer_company_section.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.width,
      color: AppColors.white,
      child: BlocBuilder<FooterBloc, FooterState>(
        builder: (context, state) {
          if (state.loading) {
            return SizedBox();
          }
          return Center(
            child: Container(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * .92,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: ResponsiveBuilder(builder: (
                context,
                sizingInformation,
              ) {
                if (sizingInformation.isMobile) {
                  return mobileViewWidget(state, context);
                } else if (sizingInformation.isTablet) {
                  return tabViewWidget(state, context);
                } else {
                  return deskTopWidget(state, context);
                }
              }),
            ),
          );
        },
      ),
    );
  }

  Widget _logoWidget(
    BuildContext context,
    FooterState state,
  ) {
    return InkWell(
      onTap: () {
        context.goNamed(RouteConstants.homeScreenPath);
      },
      child: Image.network(
        fit: BoxFit.contain,
        (state.data?.siteMap?.brand?.secLogo?.first.url ?? ""),
        width: getValueForScreenType<double>(
          context: context,
          mobile: 150,
          tablet: 150,
          desktop: 200,
        ),
      ),
    );
  }

  Widget deskTopWidget(
    FooterState state,
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 0,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //!-----------------(Logo Section)
                    _logoWidget(context, state),
                    Gap(20),
                    kStyle.med(
                      text: state.data?.tryUs?.description ?? "",
                      size: 14,
                      color: AppColors.black,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            Gap(50),
            //!-----------------(Trial Company Section)
            const Expanded(
              flex: 10,
              child: FooterCompanySection(),
            ),
          ],
        ),
        Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              kStyle.med(
                text:
                    state.data?.termsAndPolicies?.references?.first.label ?? '',
                size: 14,
                color: AppColors.black,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...(state.data?.termsAndPolicies?.references?.skip(1) ?? [])
                      .map(
                    (Cta data) => Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: textWidget(context, data.label ?? ''),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Gap(20),
      ],
    );
  }

  Widget mobileViewWidget(
    FooterState state,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _logoWidget(context, state),
        Gap(10),
        kStyle.med(
          text: state.data?.tryUs?.description ?? "",
          size: 14,
          color: AppColors.black,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //!-----------------(Trial Company Section)
            const Expanded(
              flex: 8,
              child: FooterCompanySection(),
            ),
          ],
        ),
        Gap(20),
        kStyle.med(
          text: state.data?.termsAndPolicies?.references?.first.label ?? '',
          size: 14,
          color: AppColors.black,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...(state.data?.termsAndPolicies?.references?.skip(1) ?? []).map(
              (Cta data) => Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: textWidget(context, data.label ?? ''),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget textWidget(
    BuildContext context,
    String text,
  ) {
    return InkWell(
      onTap: () {
        if (text == 'Cookie Policy') {
          context.goNamed(RouteConstants.cookiesPath);
        }
        if (text == 'Privacy Policy') {
          context.goNamed(RouteConstants.privacyPath);
        }
      },
      child: kStyle.med(
        text: text,
        size: 14,
        color: AppColors.darkBlueText,
      ),
    );
  }

  Widget tabViewWidget(
    FooterState state,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _logoWidget(context, state),
        Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kStyle.med(
              text: state.data?.tryUs?.description ?? "",
              size: 14,
              color: AppColors.black,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        Gap(30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //!-----------------(Trial Company Section)
            const Expanded(
              flex: 8,
              child: FooterCompanySection(),
            ),
          ],
        ),
        Gap(40),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kStyle.med(
              text: state.data?.termsAndPolicies?.references?.first.label ?? '',
              size: 14,
              color: AppColors.black,
            ),
            Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  children: [
                    ...(state.data?.termsAndPolicies?.references?.skip(1) ?? [])
                        .map(
                      (Cta data) => Padding(
                        padding: const EdgeInsets.only(
                          right: 8,
                        ),
                        child: textWidget(context, data.label ?? ''),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
