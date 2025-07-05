// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../bloc/about_us_bloc/about_us_bloc.dart';

class AboutAnimatedSection extends StatefulWidget {
  const AboutAnimatedSection({super.key});

  @override
  State<AboutAnimatedSection> createState() => _AboutAnimatedSectionState();
}

class _AboutAnimatedSectionState extends State<AboutAnimatedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<Offset> _imageOffsetAnimation;
  // late Animation<Offset> _textOffsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    // _imageOffsetAnimation = Tween<Offset>(
    //   begin: const Offset(-1.0, 0.0),
    //   end: Offset.zero,
    // ).animate(
    //   CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    // );

    // _textOffsetAnimation = Tween<Offset>(
    //   begin: const Offset(0.0, 1.0),
    //   end: Offset.zero,
    // ).animate(
    //   CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    // );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsBloc, AboutUsState>(
      builder: (context, state) {
        if (state.loading) {
          return SizedBox();
        }
        return Container(
          width: Constants.width,
          color: AppColors.powderBlue,
          child: Center(
            child: Container(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width,
                tablet: Constants.width,
                desktop: Constants.videoBreakPoint,
              ),
              color: AppColors.powderBlue,
              child: ResponsiveBuilder(builder: (
                context,
                sizingInformation,
              ) {
                if (sizingInformation.isDesktop) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 100,
                          ),
                          child: textWidget(state),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 400,
                          child: ImageWidget(
                            imageUrl: state.ourShieldData?.secBg?.url ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Gap(30),
                      textWidget(state),
                      Gap(30),
                      SizedBox(
                        height: getValueForScreenType(
                          context: context,
                          mobile: 250,
                          tablet: 400,
                        ),
                        width: double.infinity,
                        child: ImageWidget(
                          imageUrl: state.ourShieldData?.secBg?.url ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                }
              }),
            ),
          ),
        );
      },
    );
  }

  Widget textWidget(
    AboutUsState state,
  ) {
    return SizedBox(
      width: getValueForScreenType(
        context: context,
        mobile: Constants.width * .92,
        tablet: Constants.width * .92,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kStyle.med(
            color: AppColors.darkBlueText,
            text: state.ourShieldData?.secHeader ?? '',
            size: getValueForScreenType(
              context: context,
              mobile: 25,
              desktop: 38,
              tablet: 30,
            ),
          ),
          Gap(10),
          SizedBox(
            width: getValueForScreenType<double>(
              context: context,
              mobile: Constants.width * .9,
              tablet: Constants.width * .9,
              desktop: Constants.width * .35,
            ),
            child: kStyle.reg(
              color: AppColors.textBlueColor,
              overflow: TextOverflow.visible,
              text: state.ourShieldData?.secDescription ?? '',
              size: getValueForScreenType(
                context: context,
                mobile: 14,
                desktop: 18,
                tablet: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
