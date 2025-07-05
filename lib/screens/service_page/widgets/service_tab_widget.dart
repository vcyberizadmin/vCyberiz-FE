// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/routes/route_constants.dart';
import '../../../core/utils/styles/app_colors.dart';

class ServiceTabWidget extends StatelessWidget {
  const ServiceTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.width,
      color: AppColors.white,
      child: BlocBuilder<OurServiceBloc, OurServiceState>(
        builder: (context, state) {
          if (state.loading) {
            return SizedBox();
          }
          return Center(
            child: SizedBox(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * .92,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              child: Column(children: [
                //!-----------(Tab View section)

                tabHeadingWidget(
                  context,
                  state,
                ),

                tabDataWidget(context, state),

                Gap(30),
              ]),
            ),
          );
        },
      ),
    );
  }

  Widget tabHeadingWidget(
    BuildContext context,
    OurServiceState state,
  ) {
    final tabs = state.serviceTabsData?.section ?? [];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final isSelected = state.selectedItem == index;
          final color = _hexToColor(
            tab.tabHead?.colorIdentifier?.first.children?.first.text ?? '',
          );

          return InkWell(
            onTap: () {
              context.read<OurServiceBloc>().add(TabClickEvent(index));
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: getValueForScreenType(
                context: context,
                mobile: Constants.width * .45,
                tablet: Constants.width * .8 / tabs.length,
                desktop: Constants.desktopBreakPoint / tabs.length,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getValueForScreenType(
                        context: context,
                        mobile: 20,
                        tablet: 25,
                        desktop: 30,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedScale(
                          scale: isSelected ? 1.05 : 1.0,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: SizedBox(
                            width: getValueForScreenType(
                              context: context,
                              mobile: Constants.width * .45,
                              tablet: Constants.width * .4,
                              desktop: Constants.desktopBreakPoint * .3,
                            ),
                            child: kStyle.med(
                              text: tab.tabHead?.tabHeading ?? '',
                              color: color,
                              size: getValueForScreenType(
                                context: context,
                                mobile: 16,
                                desktop: 25,
                                tablet: 20,
                              ),
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 2,
                    width: Constants.width,
                    color: isSelected ? color : AppColors.transparent,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color _hexToColor(String hexCode) {
    final hex = hexCode.replaceAll("#", ""); // Remove the "#" if present
    return Color(int.parse("FF$hex", radix: 16)); // Add "FF" for full opacity
  }

  Widget tabDataWidget(
    BuildContext context,
    OurServiceState state,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getValueForScreenType(
        context: context,
        mobile: 20,
        tablet: 20,
        desktop: 30,
      )),
      child: ResponsiveBuilder(builder: (
        context,
        sizingInformation,
      ) {
        if (sizingInformation.isDesktop) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getValueForScreenType(
                  context: context,
                  mobile: 0,
                  tablet: 0,
                  desktop: 100,
                ),
                vertical: getValueForScreenType(
                  context: context,
                  mobile: 0,
                  tablet: 0,
                  desktop: 30,
                )),
            child: state.selectedItem == 0
                ? Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: getValueForScreenType(
                            context: context,
                            mobile: 0,
                            tablet: 0,
                            desktop: 50,
                          )),
                          child: textWidget(context, state),
                        ),
                      ),
                      //!-----------(Globe image)
                      Expanded(
                        child: imageWidget(context, state),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      //!-----------(Globe image)
                      Expanded(
                        child: imageWidget(context, state),
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: getValueForScreenType(
                            context: context,
                            mobile: 0,
                            tablet: 0,
                            desktop: 50,
                          )),
                          child: textWidget(context, state),
                        ),
                      ),
                    ],
                  ),
          );
        } else {
          return Column(
            spacing: 20,
            children: [
              //!-----------(Globe image)
              imageWidget(context, state),
              textWidget(context, state),
            ],
          );
        }
      }),
    );
  }

  Widget textWidget(
    BuildContext context,
    OurServiceState state,
  ) {
    return SizedBox(
      width: Constants.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kStyle.med(
            text: (state.serviceTabsData?.section ?? [])[state.selectedItem]
                    .tabBody
                    ?.secHeader ??
                '',
            color: AppColors.blue,
            size: getValueForScreenType(
              context: context,
              mobile: 22,
              tablet: 22,
              desktop: 30,
            ),
          ),
          const Gap(15),
          kStyle.med(
            text: (state.serviceTabsData?.section ?? [])[state.selectedItem]
                    .tabBody
                    ?.secDescription ??
                '',
            color: AppColors.black,
            size: getValueForScreenType(
              context: context,
              mobile: 14,
              tablet: 14,
              desktop: 16,
            ),
            textAlign: TextAlign.left,
            overflow: TextOverflow.visible,
          ),
          Gap(10),
          //!-------------(services button)
          ListView.builder(
              shrinkWrap: true,
              itemCount:
                  ((state.serviceTabsData?.section ?? [])[state.selectedItem]
                              .tabBody
                              ?.subSection ??
                          [])
                      .length,
              itemBuilder: (context, index) {
                final section =
                    ((state.serviceTabsData?.section ?? [])[state.selectedItem]
                            .tabBody
                            ?.subSection ??
                        [])[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kStyle.med(
                        text: section.label ?? '',
                        color: AppColors.black,
                        size: 18,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.left,
                      ),
                      Gap(5),
                      InkWell(
                        onTap: () {
                          context.goNamed(
                            RouteConstants.serviceDetailsPath,
                            queryParameters: {
                              'id': section.secCta?.href ?? '',
                            },
                          );
                        },
                        child: Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(5),
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.orange,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: kStyle.reg(
                                  text: section.secCta?.label ?? '',
                                  color: AppColors.white,
                                  size: 16,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: AppColors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget imageWidget(
    BuildContext context,
    OurServiceState state,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ImageWidget(
        imageUrl: (state.serviceTabsData?.section ?? [])[state.selectedItem]
                .tabBody
                ?.imgUrl
                ?.url ??
            '',
        width: getValueForScreenType(
          context: context,
          mobile: Constants.width,
          desktop: double.infinity,
          tablet: Constants.width,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
