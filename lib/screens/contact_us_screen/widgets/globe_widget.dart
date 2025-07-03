// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/contact_us_bloc/contact_us_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import 'address_tile.dart';

class GlobeWidget extends StatefulWidget {
  const GlobeWidget({super.key});

  @override
  State<GlobeWidget> createState() => _GlobeWidgetState();
}

class _GlobeWidgetState extends State<GlobeWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheCountryImages();
    });
    super.initState();
  }

  void _precacheCountryImages() {
    final imageUrls = [
      _getImage(''),
      _getImage(StringConst.singapore),
      _getImage(StringConst.malaysia),
      _getImage(StringConst.uae),
      _getImage(StringConst.india),
    ];

    for (final url in imageUrls) {
      precacheImage(NetworkImage(url), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsBloc, ContactUsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ResponsiveBuilder(builder: (context, sizingInformation) {
          if (sizingInformation.isMobile) {
            return Column(
              children: [
                kStyle.med(
                  text: state.locationsData?.secHeader?.first.children?.first
                          .text ??
                      '',
                  size: 25,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: (state.locationsData?.secCard ?? []).length,
                  itemBuilder: (context, index) {
                    final location =
                        (state.locationsData?.secCard ?? [])[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: AddressTile(
                          headingText: location.secBody?.header ?? '',
                          addressText: location.secBody?.content ?? '',
                          locationText: location.secBody?.subtitle ?? '',
                          height: 170),
                    );
                  },
                )
              ],
            );
          } else {
            return Container(
              width: Constants.width,
              color: AppColors.white,
              child: Center(
                child: SizedBox(
                  width: getValueForScreenType<double>(
                    context: context,
                    mobile: Constants.width * .96,
                    tablet: Constants.width * .92,
                    desktop: Constants.desktopBreakPoint,
                  ),
                  child: Column(
                    children: [
                      Gap(80),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: (state.locationsData?.secHeader?.first
                                          .children?.first.text ??
                                      '')
                                  .split(' ')[0],
                              style: TextStyle(
                                fontFamily: Constants.font,
                                color: AppColors.orangeTextColor,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' ${(state.locationsData?.secHeader?.first.children?.first.text ?? '').split(' ').skip(1).join(' ')}',
                              style: TextStyle(
                                fontFamily: Constants.font,
                                color: AppColors.darkBlueText,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Gap(40),
                      Stack(
                        children: [
                          SizedBox(
                            height: 900,
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<ContactUsBloc>()
                                    .add(SelectCountryEvent(country: ''));
                              },
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Visibility(
                                      visible: true,
                                      child: CachedNetworkImage(
                                        imageUrl: _getImage(''),
                                        key: ValueKey(_getImage('')),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Visibility(
                                      visible: state.selectedCountry ==
                                          StringConst.uae,
                                      child: CachedNetworkImage(
                                        imageUrl: _getImage(StringConst.uae),
                                        key: ValueKey(
                                            _getImage(StringConst.uae)),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Visibility(
                                      visible: state.selectedCountry ==
                                          StringConst.india,
                                      child: CachedNetworkImage(
                                        imageUrl: _getImage(StringConst.india),
                                        key: ValueKey(
                                            _getImage(StringConst.india)),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Visibility(
                                      visible: state.selectedCountry ==
                                          StringConst.malaysia,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            _getImage(StringConst.malaysia),
                                        key: ValueKey(
                                            _getImage(StringConst.malaysia)),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Visibility(
                                      visible: state.selectedCountry ==
                                          StringConst.singapore,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            _getImage(StringConst.singapore),
                                        key: ValueKey(
                                            _getImage(StringConst.singapore)),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ..._buildHoverWidgets(context, state),
                        ],
                      ),
                      Gap(40),
                    ],
                  ),
                ),
              ),
            );
          }
        });
      },
    );
  }

  List<Widget> _buildHoverWidgets(BuildContext context, ContactUsState state) {
    return [
      Positioned(
        left: getValueForScreenType(
            context: context, mobile: 10, tablet: 195, desktop: 370),
        bottom: getValueForScreenType(
            context: context, mobile: 10, tablet: 250, desktop: 240),
        child: uaeHowerWidget(
          state: state,
          location: StringConst.uae,
          heading: state.locationsData?.secCard?[2].secBody?.header ?? '',
          address: state.locationsData?.secCard?[2].secBody?.content ?? '',
          height: getValueForScreenType(
              context: context, mobile: 10, tablet: 40, desktop: 70),
          width: getValueForScreenType(
              context: context, mobile: 10, tablet: 30, desktop: 70),
          gap: getValueForScreenType(
              context: context, mobile: 10, tablet: 40, desktop: 50),
        ),
      ),
      Positioned(
        left: getValueForScreenType(
            context: context,
            mobile: 10,
            tablet: Constants.width * .34,
            desktop: 525),
        bottom: getValueForScreenType(
            context: context, mobile: 10, tablet: 220, desktop: 150),
        child: indiaHoverWidget(
          state: state,
          location: StringConst.india,
          heading: state.locationsData?.secCard?[3].secBody?.header ?? '',
          address: state.locationsData?.secCard?[3].secBody?.content ?? '',
          height: getValueForScreenType(
              context: context, mobile: 10, tablet: 160, desktop: 280),
          width: getValueForScreenType(
              context: context, mobile: 10, tablet: 150, desktop: 250),
          gap: getValueForScreenType(
              context: context, mobile: 10, tablet: 110, desktop: 200),
        ),
      ),
      Positioned(
        right: getValueForScreenType(
            context: context,
            mobile: Constants.width * .275,
            tablet: Constants.width * .34,
            desktop: 350),
        bottom: getValueForScreenType(
            context: context, mobile: 10, tablet: 170, desktop: 0),
        child: malaysiaHoverWidget(
          state: state,
          location: StringConst.malaysia,
          heading: state.locationsData?.secCard?[1].secBody?.header ?? '',
          address: state.locationsData?.secCard?[1].secBody?.content ?? '',
          subtitle: state.locationsData?.secCard?[1].secBody?.subtitle ?? '',
          height: getValueForScreenType(
              context: context, mobile: 10, tablet: 25, desktop: 90),
          width: getValueForScreenType(
              context: context, mobile: 10, tablet: 25, desktop: 240),
        ),
      ),
      Positioned(
        right: getValueForScreenType(
            context: context,
            mobile: Constants.width * .245,
            tablet: 0,
            desktop: 250),
        bottom: getValueForScreenType(
            context: context, mobile: 10, tablet: 150, desktop: 0),
        child: singaporeHoverWidget(
          state: state,
          location: StringConst.singapore,
          heading: state.locationsData?.secCard?[0].secBody?.header ?? '',
          address: state.locationsData?.secCard?[0].secBody?.content ?? '',
          subtitle: state.locationsData?.secCard?[0].secBody?.subtitle ?? '',
          height: getValueForScreenType(
              context: context, mobile: 10, tablet: 30, desktop: 60),
          width: getValueForScreenType(
              context: context, mobile: 10, tablet: 30, desktop: 40),
        ),
      ),
    ];
  }

  String _getImage(String country) {
    switch (country) {
      case "singapore":
        return 'https://djiq2s79pbv5u.cloudfront.net/project-strapi/Revamp_UI/Contact%20Us/map_latest_23/Singapore-HQ.webp';
      case "malaysia":
        return 'https://djiq2s79pbv5u.cloudfront.net/project-strapi/Revamp_UI/Contact%20Us/map_latest_23/Malaysia.webp';
      case "uae":
        return 'https://djiq2s79pbv5u.cloudfront.net/project-strapi/Revamp_UI/Contact%20Us/map_latest_23/UAE.webp';
      case "india":
        return 'https://djiq2s79pbv5u.cloudfront.net/project-strapi/Revamp_UI/Contact%20Us/map_latest_23/India.webp';
      default:
        return 'https://djiq2s79pbv5u.cloudfront.net/project-strapi/Revamp_UI/Contact%20Us/map_latest_23/Asia.webp';
    }
  }

  Widget uaeHowerWidget({
    required ContactUsState state,
    required String location,
    required String heading,
    required String address,
    required double height,
    required double width,
    required double gap,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            state.selectedCountry == location
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(gap),
                      AddressTile(
                        addressText: address,
                        headingText: heading,
                        locationText: '',
                        height: 150,
                      ),
                    ],
                  )
                : Container(
                    height: gap + 150,
                    color: AppColors.transparent,
                  ),
            MouseRegion(
              onEnter: (_) {
                context
                    .read<ContactUsBloc>()
                    .add(SelectCountryEvent(country: location));
              },
              onExit: (_) {
                context
                    .read<ContactUsBloc>()
                    .add(SelectCountryEvent(country: ''));
              },
              child: InkWell(
                onTap: () {
                  context
                      .read<ContactUsBloc>()
                      .add(SelectCountryEvent(country: location));
                },
                child: Container(
                  alignment: Alignment.topRight,
                  height: height,
                  width: width,
                  color: AppColors.transparent,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget indiaHoverWidget({
    required ContactUsState state,
    required String location,
    required String heading,
    required String address,
    required double height,
    required double width,
    required double gap,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Positioned(
              child: state.selectedCountry == location
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(gap),
                        AddressTile(
                          addressText: address,
                          headingText: heading,
                          locationText: '',
                          height: 180,
                        ),
                      ],
                    )
                  : Container(
                      height: gap + 150,
                      color: AppColors.transparent,
                    ),
            ),
            MouseRegion(
              onEnter: (_) {
                context
                    .read<ContactUsBloc>()
                    .add(SelectCountryEvent(country: location));
              },
              onExit: (_) {
                context
                    .read<ContactUsBloc>()
                    .add(SelectCountryEvent(country: ''));
              },
              child: InkWell(
                onTap: () {
                  context
                      .read<ContactUsBloc>()
                      .add(SelectCountryEvent(country: location));
                },
                child: Container(
                  alignment: Alignment.topRight,
                  height: height,
                  width: width,
                  color: AppColors.transparent,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget singaporeHoverWidget({
    required ContactUsState state,
    required String location,
    required String heading,
    required String address,
    required String subtitle,
    required double height,
    required double width,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MouseRegion(
              onEnter: (_) {
                context
                    .read<ContactUsBloc>()
                    .add(SelectCountryEvent(country: location));
              },
              onExit: (_) {
                context
                    .read<ContactUsBloc>()
                    .add(SelectCountryEvent(country: ''));
              },
              child: InkWell(
                onTap: () {
                  context
                      .read<ContactUsBloc>()
                      .add(SelectCountryEvent(country: location));
                },
                child: Container(
                  alignment: Alignment.topRight,
                  height: height,
                  width: width,
                  color: AppColors.transparent,
                ),
              ),
            ),
            Gap(250),
          ],
        ),
        state.selectedCountry == location
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AddressTile(
                    addressText: address,
                    headingText: heading,
                    locationText: subtitle,
                    height: 150,
                  ),
                ],
              )
            : Container(
                height: 150,
                width: 10,
                color: AppColors.transparent,
              ),
      ],
    );
  }

  Widget malaysiaHoverWidget({
    required ContactUsState state,
    required String location,
    required String heading,
    required String address,
    required String subtitle,
    required double height,
    required double width,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Gap(200),
            MouseRegion(
              onEnter: (_) {
                context
                    .read<ContactUsBloc>()
                    .add(SelectCountryEvent(country: location));
              },
              onExit: (_) {
                context
                    .read<ContactUsBloc>()
                    .add(SelectCountryEvent(country: ''));
              },
              child: InkWell(
                onTap: () {
                  context
                      .read<ContactUsBloc>()
                      .add(SelectCountryEvent(country: location));
                },
                child: Container(
                  alignment: Alignment.topRight,
                  height: height,
                  width: width * .3,
                  color: AppColors.transparent,
                ),
              ),
            ),
            MouseRegion(
              onEnter: (_) {
                context
                    .read<ContactUsBloc>()
                    .add(SelectCountryEvent(country: location));
              },
              onExit: (_) {
                context
                    .read<ContactUsBloc>()
                    .add(SelectCountryEvent(country: ''));
              },
              child: InkWell(
                onTap: () {
                  context
                      .read<ContactUsBloc>()
                      .add(SelectCountryEvent(country: location));
                },
                child: Container(
                  alignment: Alignment.topRight,
                  height: height * .7,
                  width: width * .7,
                  color: AppColors.transparent,
                ),
              ),
            ),
          ],
        ),
        state.selectedCountry == location
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressTile(
                    addressText: address,
                    headingText: heading,
                    locationText: subtitle,
                    height: 170,
                  ),
                ],
              )
            : Container(
                height: 140,
                width: 10,
                color: AppColors.transparent,
              ),
      ],
    );
  }
}
