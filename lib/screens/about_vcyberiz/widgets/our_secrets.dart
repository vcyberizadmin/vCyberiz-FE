// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../bloc/about_us_bloc/about_us_bloc.dart';
import '../../../core/utils/config/config.dart';
import '../../../core/utils/constants/constants.dart';
import '../../../core/utils/styles/app_colors.dart';

class OurSecrets extends StatefulWidget {
  const OurSecrets({super.key});

  @override
  State<OurSecrets> createState() => _OurSecretsState();
}

class _OurSecretsState extends State<OurSecrets>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> headerAnimation;
  late Animation<double> descriptionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimations() {
    if (!_controller.isAnimating) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('OurSecretsVisibility'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0) {
          _startAnimations(); // Start animations when widget is visible
        }
      },
      child: BlocBuilder<AboutUsBloc, AboutUsState>(
        builder: (context, state) {
          if (state.loading) {
            return const SizedBox();
          }

          // Define animations
          headerAnimation = Tween<double>(begin: 500, end: 0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
          );
          descriptionAnimation = Tween<double>(begin: -500, end: 0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
          );

          return Container(
            width: Constants.width,
            decoration: BoxDecoration(
              color: AppColors.antiFlashWhite,
            ),
            child: Center(
              child: SizedBox(
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: Constants.width * .92,
                  tablet: Constants.width * .92,
                  desktop: Constants.desktopBreakPoint,
                ),
                child: Column(
                  crossAxisAlignment: getValueForScreenType(
                    context: context,
                    mobile: CrossAxisAlignment.start,
                    tablet: CrossAxisAlignment.start,
                    desktop: CrossAxisAlignment.center,
                  ),
                  children: [
                    Gap(getValueForScreenType(
                      context: context,
                      mobile: 20,
                      tablet: 50,
                      desktop: 50,
                    )),
                    kStyle.semiBold(
                      text: state.ourSecretData?.secHeader ?? '',
                      color: AppColors.blue,
                      size: getValueForScreenType<double>(
                        context: context,
                        mobile: 25,
                        tablet: 30,
                        desktop: 35,
                      ),
                      align: getValueForScreenType(
                        context: context,
                        mobile: TextAlign.left,
                        tablet: TextAlign.left,
                        desktop: TextAlign.center,
                      ),
                    ),
                    Gap(getValueForScreenType(
                      context: context,
                      mobile: 20,
                      tablet: 30,
                      desktop: 30,
                    )),
                    SizedBox(
                      width: getValueForScreenType<double>(
                        context: context,
                        mobile: Constants.width * .9,
                        tablet: Constants.width * .8,
                        desktop: Constants.width * .6,
                      ),
                      child: kStyle.reg(
                        text: state.ourSecretData?.secDescription ?? '',
                        color: Colors.black,
                        size: getValueForScreenType<double>(
                          context: context,
                          mobile: 16,
                          tablet: 16,
                          desktop: 20,
                        ),
                        textAlign: getValueForScreenType(
                          context: context,
                          mobile: TextAlign.left,
                          tablet: TextAlign.left,
                          desktop: TextAlign.center,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    Gap(getValueForScreenType<double>(
                      context: context,
                      mobile: 20,
                      tablet: 50,
                      desktop: 50,
                    )),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
