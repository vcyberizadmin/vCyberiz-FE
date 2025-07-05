// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/partners_bloc/partners_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class PartnersSection extends StatelessWidget {
  const PartnersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.powderBlue,
      width: Constants.width,
      child: Center(
        child: SizedBox(
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width,
            tablet: Constants.width,
            desktop: Constants.videoBreakPoint,
          ),
          child: BlocBuilder<PartnersBloc, PartnersState>(
            builder: (context, state) {
              return ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  if (sizingInformation.isDesktop) {
                    return Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: getValueForScreenType(
                                context: context,
                                mobile: 10,
                                desktop: 80,
                                tablet: 30,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kStyle.med(
                                  text: state.technology?.secHeader ?? "",
                                  size: 35,
                                  color: AppColors.darkBlueText,
                                  overflow: TextOverflow.visible,
                                ),
                                Gap(16),
                                kStyle.med(
                                  text: state.technology?.secDescription ?? "",
                                  size: getValueForScreenType(
                                    context: context,
                                    mobile: 16,
                                    tablet: 16,
                                    desktop: 20,
                                  ),
                                  color: AppColors.darkBlueText,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ImageWidget(
                            imageUrl: state.technology?.secImg?.url ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Gap(40),
                        SizedBox(
                          width: getValueForScreenType(
                            context: context,
                            mobile: Constants.width * .92,
                            tablet: Constants.width * .92,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kStyle.med(
                                text: state.technology?.secHeader ?? "",
                                size: 32,
                                color: AppColors.darkBlueText,
                                overflow: TextOverflow.visible,
                              ),
                              Gap(8),
                              kStyle.med(
                                maxLines: 10,
                                text: state.technology?.secDescription ?? "",
                                size: getValueForScreenType(
                                  context: context,
                                  mobile: 16,
                                  tablet: 16,
                                  desktop: 20,
                                ),
                                color: AppColors.darkBlueText,
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                        ),
                        Gap(32),
                        SizedBox(
                          height: getValueForScreenType(
                            context: context,
                            mobile: 250,
                            tablet: 400,
                          ),
                          width: double.infinity,
                          child: ImageWidget(
                            imageUrl: state.technology?.secImg?.url ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
