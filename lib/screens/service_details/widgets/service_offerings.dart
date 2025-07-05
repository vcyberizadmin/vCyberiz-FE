// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:vcyberiz/bloc/our_service_bloc/our_service_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/data/model/our_service_model/service_offerrings_model.dart';

import 'card_widget.dart';

class ServiceOfferings extends StatelessWidget {
  final String documentId;
  const ServiceOfferings({
    super.key,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OurServiceBloc, OurServiceState>(
      builder: (context, state) {
        if ((state.serviceDetailsData?.serviceOfferingIsRequired) != true) {
          return SizedBox();
        }
        return Container(
          width: Constants.width,
          color: AppColors.antiFlashWhite,
          child: Center(
            child: Container(
              width: getValueForScreenType(
                context: context,
                mobile: Constants.width * .92,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getValueForScreenType(
                    context: context,
                    mobile: 15,
                    tablet: 20,
                    desktop: 30,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left Section
                    kStyle.med(
                      text: state.serviceOfferingData?.secHeader ?? '',
                      size: getValueForScreenType(
                        context: context,
                        mobile: 25,
                        tablet: 30,
                        desktop: 35,
                      ),
                      color: AppColors.blue,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
                    Gap(20),
                    gridWidget(context, state)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color hexToColor(String hexCode) {
    final buffer = StringBuffer();
    if (hexCode.length == 6 || hexCode.length == 7)
      buffer.write('ff'); // Add full opacity
    buffer.write(hexCode.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  Widget gridWidget(BuildContext context, OurServiceState state) {
    final List<SecCard> items = state.serviceOfferingData?.secCard ?? [];

    return ResponsiveBuilder(
      builder: (context, sizingInfo) {
        if (sizingInfo.isTablet) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 50,
                mainAxisSpacing: 15,
                childAspectRatio: .8 / .5,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return _buildTabletCard(item);
              },
            ),
          );
        }

        if (sizingInfo.isDesktop) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: EqualHeightWrap(
              items: items,
              buildCard: (item, height) => Container(
                width: (Constants.desktopBreakPoint / 3) - 100,
                height: height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      hexToColor(item.colorIdentifier ?? '').withOpacity(.01),
                      AppColors.white,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 0.8],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: _buildCardContent(context, item, true),
              ),
            ),
          );
        }

        // Mobile fallback
        return Column(
          children: items.map((item) {
            return Container(
              width: Constants.width,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    hexToColor(item.colorIdentifier ?? '').withOpacity(.01),
                    AppColors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.8],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: _buildCardContent(context, item, false),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildCardContent(
    BuildContext context,
    SecCard item,
    bool isDesktop,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: hexToColor(item.colorIdentifier ?? ''),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: kStyle.bold(
              text: item.secHeader ?? '',
              size: 18,
              color: AppColors.white,
            ),
          ),
        ),
        Gap(10),
        ...item.secSubCard!.map((items) => pointWidget(items)),
        Gap(10),
      ],
    );
  }

  Widget _buildTabletCard(SecCard item) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            hexToColor(item.colorIdentifier ?? '').withOpacity(.01),
            AppColors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.8],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: hexToColor(item.colorIdentifier ?? ''),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: kStyle.bold(
                      text: item.secHeader ?? '',
                      size: 20,
                      color: AppColors.white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: double.infinity,
                color: AppColors.grey,
                width: 1,
              ),
            ),
            Gap(20),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...item.secSubCard!.map((items) => pointWidget(items)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pointWidget(
    SecSubCard items,
  ) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if ((items.label ?? '').isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: kStyle.reg(
                text: items.label ?? '',
                size: 14,
                color: AppColors.black,
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageWidget(
                imageUrl: items.secLogo?.url ?? '',
                width: 25,
              ),
              Gap(10),
              Expanded(
                child: ((items.label ?? '').isNotEmpty)
                    ? kStyle.med(
                        text: items.secDescription ?? '',
                        size: 17,
                        color: AppColors.black,
                        overflow: TextOverflow.visible,
                      )
                    : kStyle.reg(
                        text: items.secDescription ?? '',
                        size: 17,
                        color: AppColors.black,
                        overflow: TextOverflow.visible,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
