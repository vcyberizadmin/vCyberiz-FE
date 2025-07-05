// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import '../../../bloc/solutions_bloc/solutions_bloc.dart';
import '../../../core/utils/global_widgets/custom_animated_button.dart';
import '../../../core/utils/styles/app_colors.dart';
import '../../../data/model/solutions_model/solutions_we_offer_model.dart';

class SolutionWeOfferScreen extends StatelessWidget {
  const SolutionWeOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.width,
      color: AppColors.backGroundColor,
      child: BlocBuilder<SolutionsBloc, SolutionsState>(
        builder: (context, state) {
          return Center(
            child: SizedBox(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * .96,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      getValueForScreenType(
                        context: context,
                        mobile: 10,
                        tablet: 50,
                        desktop: 50,
                      ),
                    ),
                    child: Column(
                      children: [
                        //!------------(Header Section)

                        kStyle.bold(
                          text: state.solutionsWeOffer?.secHeader ?? '',
                          color: Colors.orange,
                          size: 14,
                        ),
                        Gap(10),
                        kStyle.bold(
                          text: state.solutionsWeOffer?.subHeader ?? '',
                          textAlign: TextAlign.center,
                          size: 25,
                          color: AppColors.textBlueColor,
                        ),
                        Gap(10),
                        Container(
                          width: getValueForScreenType(
                            context: context,
                            mobile: Constants.width,
                            tablet: Constants.width,
                            desktop: Constants.width * .7,
                          ),
                          child: kStyle.reg(
                            text: state.solutionsWeOffer?.description ?? '',
                            textAlign: TextAlign.center,
                            size: 12,
                            color: AppColors.textBlueColor,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                        Gap(20),
                        //!-----------------------(Read more Button)

                        CustomAnimatedButton(
                          unselectedTextColor: AppColors.white,
                          textColor: AppColors.white,
                          selectedTextColor: AppColors.white,
                          borderColor: AppColors.transparent,
                          bgButtonColor: AppColors.darkOrangeColor,
                          text:
                              state.solutionsWeOffer?.secButton?.first.label ??
                                  '',
                          buttonWidth: 120,
                          textSize: 12,
                        ),
                      ],
                    ),
                  ),

                  //!-----------------(Image Cards)
                  Wrap(
                    children: [
                      ...(state.solutionsWeOffer?.solutions ?? []).map(
                        (Solution data) => cardWidget(
                          context: context,
                          iconImage: data.secLogo?.url ?? '',
                          bgImage: data.secBg?.url ?? '',
                          title: data.details?.header ?? '',
                          description: data.details?.content ?? '',
                        ),
                      ),
                    ],
                  ),

                  Gap(50),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget cardWidget({
    required BuildContext context,
    required String bgImage,
    required String iconImage,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: SizedBox(
        width: getValueForScreenType(
          context: context,
          mobile: Constants.width,
          tablet: 340,
          desktop: Constants.width * .35,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: getValueForScreenType(
                    context: context,
                    mobile: 240,
                    tablet: 240,
                    desktop: 350,
                  ),
                  width: getValueForScreenType(
                    context: context,
                    mobile: Constants.width,
                    tablet: 340,
                    desktop: Constants.width * .35,
                  ),
                  child: ImageWidget(
                    imageUrl: bgImage,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                    bottom: getValueForScreenType(
                      context: context,
                      mobile: 10,
                      tablet: 0,
                      desktop: Constants.width < 1300
                          ? 30
                          : Constants.width < 1400
                              ? 10
                              : 0,
                    ),
                    left: 40,
                    right: 40,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ImageWidget(
                          imageUrl: iconImage,
                          height: 2,
                          width: 2,
                        ),
                      ),
                    ))
              ],
            ),
            kStyle.med(
              text: title,
              color: AppColors.darkBlue,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: kStyle.med(
                color: AppColors.darkBlue,
                textAlign: TextAlign.center,
                size: 10,
                text: description,
                overflow: TextOverflow.visible,
              ),
            )
          ],
        ),
      ),
    );
  }
}
