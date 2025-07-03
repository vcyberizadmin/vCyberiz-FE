import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/events_bloc/events_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_animated_button.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/data/model/events_model/related_event_list_model.dart';

class RelatedEventsList extends StatelessWidget {
  const RelatedEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsBloc, EventsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          width: Constants.width,
          child: Center(
            child: SizedBox(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * 0.96,
                tablet: Constants.width * 0.92,
                desktop: Constants.desktopBreakPoint,
              ),
              child: Column(
                children: [
                  Gap(
                    getValueForScreenType(
                        context: context, mobile: 15, desktop: 30, tablet: 25),
                  ),
                  //!-------------------header
                  kStyle.bold(
                      text: state.relatedEvents?.secHeader ?? '',
                      color: AppColors.textBlueColor,
                      size: getValueForScreenType(
                          context: context,
                          mobile: 20,
                          desktop: 40,
                          tablet: 25)),
                  Gap(getValueForScreenType(
                    context: context,
                    mobile: 10,
                    desktop: 30,
                    tablet: 25,
                  )),
                  //!----------------gridview section
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getValueForScreenType(
                              context: context,
                              mobile: 1,
                              desktop: 3,
                              tablet: 1),
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: getValueForScreenType(
                            context: context,
                            mobile: 2 / 3,
                            desktop: 3 / 3.6,
                            tablet: 3 / 2,
                          )),
                      itemCount: (state.relatedEvents?.secBody ?? []).length,
                      padding: EdgeInsets.all(getValueForScreenType(
                          context: context, mobile: 8, desktop: 20, tablet: 8)),
                      itemBuilder: (context, index) {
                        final data = state.relatedEvents?.secBody?[index];
                        return _cardWidget(
                          context,
                          state,
                          data,
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _cardWidget(
    BuildContext context,
    EventsState state,
    EventList? data,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.primaryOrangeColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                //!--------------------image
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    data?.secBg?.url ?? '',
                    fit: BoxFit.fill,
                    height: getValueForScreenType(
                        context: context,
                        mobile: 200,
                        desktop: 300,
                        tablet: 300),
                    width: double.infinity,
                  ),
                ),
                //!-----------------date container
                Visibility(
                  visible: getValueForScreenType<bool>(
                    context: context,
                    mobile: false,
                    tablet: true,
                    desktop: true,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: getValueForScreenType(
                            context: context,
                            mobile: null,
                            desktop: 80,
                            tablet: 70),
                        width: getValueForScreenType(
                            context: context,
                            mobile: null,
                            desktop: 60,
                            tablet: 50),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            kStyle.bold(
                              text: data?.dateBox?.month ?? '',
                              color: Colors.white,
                            ),
                            kStyle.bold(
                              text: data?.dateBox?.year ?? '',
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(5),
            kStyle.med(
              text: data?.cardHeader ?? '',
              size: getValueForScreenType(
                  context: context, mobile: 12, desktop: 20, tablet: 15),
            ),
            Gap(10),
            kStyle.med(
                overflow: TextOverflow.visible,
                text: data?.cardDescription ?? '',
                size: 13),
            Gap(10),
            CustomAnimatedButton(
              bgButtonColor: AppColors.white,
              buttonWidth: 150,
              unselectedTextColor: AppColors.primaryOrangeColor,
              selectedTextColor: AppColors.white,
              textColor: AppColors.primaryOrangeColor,
              borderColor: AppColors.primaryOrangeColor,
              text: data?.secCta?.first.label?.name ?? '',
              isWhiteBg: false,
            ),
          ],
        ),
      ),
    );
  }
}
