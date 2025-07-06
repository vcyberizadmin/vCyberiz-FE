// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class ScopeOfServiceSection extends StatelessWidget {
  final String documentId;
  const ScopeOfServiceSection({
    super.key,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OurServiceBloc, OurServiceState>(
      builder: (context, state) {
        if ((state.serviceDetailsData?.innerPage?[1].component ?? '') !=
            'm365.scope-of-service') {
          return SizedBox();
        }
        return Container(
          width: Constants.width,
          color: AppColors.powderBlue,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: getValueForScreenType(
                  context: context,
                  mobile: 30,
                  tablet: 0,
                  desktop: 30,
                ),
              ),
              child: ResponsiveBuilder(builder: (context, sizingInformation) {
                if (sizingInformation.isMobile) {
                  return Container(
                    width: getValueForScreenType(
                      context: context,
                      mobile: Constants.width * .94,
                      tablet: Constants.width * .94,
                      desktop: Constants.desktopBreakPoint,
                    ),
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textWidget(
                          context,
                          state,
                        ),
                        imageWidget(context, state),
                      ],
                    ),
                  );
                } else if (sizingInformation.isTablet) {
                  return documentId == 'g1c3nnw9zmcxye2xfxakcprk' ||
                          documentId == 'n2aihpnij6mk3ac1yzrk7x45'
                      ? Column(
                          spacing: 20,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: getValueForScreenType(
                                context: context,
                                mobile: Constants.width * .9,
                                tablet: Constants.width * .9,
                                desktop: Constants.desktopBreakPoint,
                              ),
                              child: Center(
                                child: textWidget(
                                  context,
                                  state,
                                ),
                              ),
                            ),
                            ImageWidget(
                              width: Constants.width,
                              imageUrl: state.serviceDetailsData?.innerPage?[1]
                                      .secImg?.url ??
                                  '', // Replace with your image
                              fit: BoxFit.cover,
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Container(
                            width: getValueForScreenType(
                              context: context,
                              mobile: Constants.width * .9,
                              tablet: Constants.width * .9,
                              desktop: Constants.desktopBreakPoint,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Left: Expandable Sections
                                Expanded(
                                  flex: 2,
                                  child: textWidget(
                                    context,
                                    state,
                                  ),
                                ),
                                Gap(
                                  getValueForScreenType(
                                      context: context,
                                      mobile: 0,
                                      tablet: 20,
                                      desktop: 50),
                                ),
                                // Right: Image or Graphic
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: (state
                                                      .serviceDetailsData
                                                      ?.innerPage?[1]
                                                      .secAccordion ??
                                                  [])
                                              .isEmpty
                                          ? 0
                                          : 30,
                                    ),
                                    child: imageWidget(
                                      context,
                                      state,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                } else {
                  return Container(
                    width: getValueForScreenType(
                      context: context,
                      mobile: Constants.width * .9,
                      tablet: Constants.width * .9,
                      desktop: Constants.desktopBreakPoint,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left: Expandable Sections
                        Expanded(
                          flex: 2,
                          child: textWidget(
                            context,
                            state,
                          ),
                        ),
                        Gap(
                          getValueForScreenType(
                              context: context,
                              mobile: 0,
                              tablet: 20,
                              desktop: Constants.width * .05),
                        ),
                        // Right: Image or Graphic
                        Expanded(
                          flex: getValueForScreenType(
                              context: context,
                              mobile: 1,
                              tablet: 2,
                              desktop: 3),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: (state.serviceDetailsData?.innerPage?[1]
                                              .secAccordion ??
                                          [])
                                      .isEmpty
                                  ? 0
                                  : 30,
                            ),
                            child: imageWidget(
                              context,
                              state,
                            ),
                          ),
                        ),
                      ],
                    ),
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
    BuildContext context,
    OurServiceState state,
  ) {
    return SizedBox(
      height: getValueForScreenType(
        context: context,
        mobile: null,
        tablet:
            (state.serviceDetailsData?.innerPage?[1].secAccordion ?? []).isEmpty
                ? 350
                : null,
        desktop: ((state.serviceDetailsData?.innerPage?[1].secAccordion ?? [])
                    .isEmpty) ||
                documentId == 'n2aihpnij6mk3ac1yzrk7x45'
            ? 450
            : null,
      ),
      child: Column(
        crossAxisAlignment: getValueForScreenType(
          context: context,
          mobile: CrossAxisAlignment.center,
          tablet: CrossAxisAlignment.start,
          desktop: CrossAxisAlignment.start,
        ),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          kStyle.med(
            text: state.serviceDetailsData?.innerPage?[1].secHeader ?? '',
            size: getValueForScreenType(
                context: context, mobile: 25, tablet: 30, desktop: 35),
            color: AppColors.blue,
            textAlign: TextAlign.left,
            overflow: TextOverflow.visible,
          ),
          Gap(10),
          kStyle.med(
            text: state.serviceDetailsData?.innerPage?[1].secDescription ?? '',
            size: getValueForScreenType(
                context: context, mobile: 16, tablet: 18, desktop: 18),
            color: AppColors.blue,
            textAlign: TextAlign.left,
            overflow: TextOverflow.visible,
            maxLines: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
                (state.serviceDetailsData?.innerPage?[1].secAccordion ?? [])
                    .length,
            itemBuilder: (context, index) {
              final item =
                  (state.serviceDetailsData?.innerPage?[1].secAccordion ??
                      [])[index];
              final isExpanded = state.expandedIndex == index;

              return state.serviceDetailsData?.documentId ==
                      'n2aihpnij6mk3ac1yzrk7x45'
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.blue,
                              ),
                            ),
                          ),
                          Gap(10),
                          Expanded(
                            child: kStyle.med(
                              text: item.secDescription ?? '',
                              size: 16,
                              color: AppColors.blue,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: index + 1 ==
                                      (state.serviceDetailsData?.innerPage?[1]
                                                  .secAccordion ??
                                              [])
                                          .length
                                  ? AppColors.transparent
                                  : AppColors.grey),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: kStyle.med(
                                  text: item.secHeader ?? '',
                                  size: getValueForScreenType(
                                      context: context,
                                      mobile: 20,
                                      tablet: 20,
                                      desktop: 25),
                                  color: AppColors.blue,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<OurServiceBloc>().add(
                                        ToggleScopeSectionEvent(index),
                                      );
                                },
                                child: Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: AppColors.blue,
                                ),
                              ),
                            ],
                          ),
                          if (isExpanded)
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 16,
                                right: 16,
                              ),
                              child: kStyle.reg(
                                text: item.secDescription ?? '',
                                size: 16,
                                color: AppColors.blue,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                        ],
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget imageWidget(
    BuildContext context,
    OurServiceState state,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ImageWidget(
        height: getValueForScreenType(
          context: context,
          mobile: 220,
          tablet: 300,
          desktop: 450,
        ),
        imageUrl: state.serviceDetailsData?.innerPage?[1].secImg?.url ??
            '', // Replace with your image
        fit: BoxFit.cover,
      ),
    );
  }
}
