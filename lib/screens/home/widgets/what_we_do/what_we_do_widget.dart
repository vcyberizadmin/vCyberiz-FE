// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../../bloc/what_we_do_bloc/what_we_do_bloc.dart';
import '../../../../core/utils/config/config.dart';

class WhatWeDoWidget extends StatelessWidget {
  const WhatWeDoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getValueForScreenType(
        context: context,
        mobile: null,
        tablet: null,
        desktop: 500,
      ),
      width: Constants.width,
      child: BlocBuilder<WhatWeDoBloc, WhatWeDoState>(
        builder: (context, state) {
          if (state.data == null && state.loading == true) {
            return const SizedBox();
          }
          return Center(
            child: SizedBox(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * .92,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: ResponsiveBuilder(builder: (
                  context,
                  sizingInformation,
                ) {
                  if (sizingInformation.isDesktop) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //!-------------------------(details Section)

                        Expanded(flex: 1, child: headingWidget(context, state)),
                        Gap(40),
                        //!-------------------------(Image Section)
                        Center(
                          child: GifWidget(
                            height: getValueForScreenType(
                              context: context,
                              mobile: 400,
                              tablet: 500,
                              desktop: 500,
                            ),
                            imageUrl: state.data?.secGif?.first.url ?? '',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //!-------------------------(Image Section)
                        Center(
                          child: GifWidget(
                            imageUrl: state.data?.secGif?.first.url ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Gap(
                          getValueForScreenType<double>(
                            context: context,
                            mobile: 20,
                            tablet: 40,
                            desktop: 80,
                          ),
                        ),
                        //!-------------------------(details Section)

                        headingWidget(context, state),
                      ],
                    );
                  }
                }),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget headingWidget(BuildContext context, WhatWeDoState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //!----------------------------(Main Heading)
        kStyle.med(
          text: state.data?.sectionLabel ?? '',
          color: AppColors.darkOrangeColor,
          size: getValueForScreenType<double>(
            context: context,
            mobile: 16,
            tablet: 16,
            desktop: 18,
          ),
          overflow: TextOverflow.visible,
        ),

        //!------------------------(Sub Title)
        kStyle.med(
          text: state.data?.heading ?? '',
          size: getValueForScreenType(
            context: context,
            mobile: 25,
            tablet: 30,
            desktop: 35,
          ),
          overflow: TextOverflow.visible,
          color: AppColors.darkBlueText,
        ),
        Gap(10),

        SizedBox(
          child: kStyle.reg(
            text: state.data?.description ?? '',
            color: AppColors.black,
            size: getValueForScreenType<double>(
              context: context,
              mobile: 16,
              tablet: 16,
              desktop: 18,
            ),
            overflow: TextOverflow.visible,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
