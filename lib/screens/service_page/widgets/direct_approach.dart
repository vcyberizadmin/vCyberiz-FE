// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/hover/hover.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class DirectApproachScreen extends StatelessWidget {
  const DirectApproachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OurServiceBloc, OurServiceState>(
      builder: (context, state) {
        return Container(
          width: Constants.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                state.servicedirectApproachdata?.bgImg?.url ?? '',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: SizedBox(
              width: getValueForScreenType(
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
                  Gap(50),
                  kStyle.med(
                    text: state.servicedirectApproachdata?.secHeader ?? '',
                    size: 30,
                    color: AppColors.blue,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.left,
                  ),
                  Gap(10),
                  SizedBox(
                    width: getValueForScreenType(
                      context: context,
                      mobile: Constants.width * .92,
                      tablet: Constants.width * .92,
                      desktop: Constants.desktopBreakPoint * .32,
                    ),
                    child: kStyle.med(
                      text:
                          state.servicedirectApproachdata?.secDescription ?? '',
                      size: 16,
                      color: AppColors.blue,
                      overflow: TextOverflow.visible,
                      textAlign: getValueForScreenType(
                        context: context,
                        mobile: TextAlign.left,
                        tablet: TextAlign.left,
                        desktop: TextAlign.center,
                      ),
                    ),
                  ),
                  Gap(20),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getValueForScreenType(
                      context: context,
                      mobile: 0,
                      tablet: 0,
                      desktop: 120,
                    )),
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getValueForScreenType(
                            context: context,
                            mobile: 1,
                            tablet: 2,
                            desktop: 3,
                          ),
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: getValueForScreenType(
                            context: context,
                            mobile: .9 / .7,
                            tablet: .9 / .55,
                            desktop: .9 / .55,
                          ),
                        ),
                        itemCount:
                            (state.servicedirectApproachdata?.secCard ?? [])
                                .length,
                        itemBuilder: (context, index) {
                          final item =
                              state.servicedirectApproachdata?.secCard?[index];

                          return HoverView(builder: (isHovered) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color: isHovered
                                    ? AppColors.blue
                                    : AppColors.transparent,
                                border: Border.all(color: AppColors.blue),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: getValueForScreenType(
                                    context: context,
                                    mobile: 15,
                                    tablet: 15,
                                    desktop: 20,
                                  ),
                                  vertical: getValueForScreenType(
                                    context: context,
                                    mobile: 15,
                                    tablet: 20,
                                    desktop: 25,
                                  )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: getValueForScreenType(
                                        context: context,
                                        mobile: 40,
                                        tablet: 40,
                                        desktop: 55),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isHovered
                                            ? AppColors.white
                                            : AppColors.blue),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(
                                        item?.logoImg?.url ?? '',
                                        width: 25,
                                        height: 25,
                                        color: isHovered
                                            ? AppColors.blue
                                            : AppColors.white,
                                      ),
                                    ),
                                  ),
                                  Gap(10),
                                  kStyle.med(
                                    text: item?.secHeader ?? '',
                                    size: 20,
                                    color: isHovered
                                        ? AppColors.white
                                        : AppColors.blue,
                                    overflow: TextOverflow.visible,
                                  ),
                                  Gap(5),
                                  kStyle.reg(
                                    text: item?.description ?? '',
                                    size: 16,
                                    color: isHovered
                                        ? AppColors.white
                                        : AppColors.blue,
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            );
                          });
                        }),
                  ),
                  Gap(50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
