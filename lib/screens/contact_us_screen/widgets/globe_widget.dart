// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/contact_us_bloc/contact_us_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
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
                            height: getValueForScreenType<double>(
                              context: context,
                              mobile: Constants.width * .96,
                              tablet: Constants.width * .92,
                              desktop: Constants.desktopBreakPoint,
                            ),
                            width: double.infinity,
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
                                      child: ImageWidget(
                                        imageUrl: _getImage(''),
                                        key: ValueKey(_getImage('')),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Visibility(
                                      visible: state.selectedCountry ==
                                          StringConst.uae,
                                      child: ImageWidget(
                                        imageUrl: _getImage(StringConst.uae),
                                        key: ValueKey(
                                            _getImage(StringConst.uae)),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Visibility(
                                      visible: state.selectedCountry ==
                                          StringConst.india,
                                      child: ImageWidget(
                                        imageUrl: _getImage(StringConst.india),
                                        key: ValueKey(
                                            _getImage(StringConst.india)),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Visibility(
                                      visible: state.selectedCountry ==
                                          StringConst.malaysia,
                                      child: ImageWidget(
                                        imageUrl:
                                            _getImage(StringConst.malaysia),
                                        key: ValueKey(
                                            _getImage(StringConst.malaysia)),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Visibility(
                                      visible: state.selectedCountry ==
                                          StringConst.singapore,
                                      child: ImageWidget(
                                        imageUrl:
                                            _getImage(StringConst.singapore),
                                        key: ValueKey(
                                            _getImage(StringConst.singapore)),
                                        fit: BoxFit.fitHeight,
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
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    double centerOfTheGlobe = 0;
    switch (deviceType) {
      case DeviceScreenType.desktop:
        centerOfTheGlobe = Constants.desktopBreakPoint;
        break;
      case DeviceScreenType.tablet:
        centerOfTheGlobe = (Constants.width * .92);
        break;
      case DeviceScreenType.mobile:
        centerOfTheGlobe = (Constants.width * .96);
        break;
      default:
        centerOfTheGlobe = MediaQuery.of(context).size.width;
        break;
    }
    return [
      Positioned(
        left: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .17,
          tablet: centerOfTheGlobe * .17,
          desktop: centerOfTheGlobe * .17,
        ),
        bottom: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .38,
          tablet: centerOfTheGlobe * .38,
          desktop: centerOfTheGlobe * .38,
        ),
        child: uaeHoverWidget(
          state: state,
          location: StringConst.uae,
          heading: state.locationsData?.secCard?[2].secBody?.header ?? '',
          address: state.locationsData?.secCard?[2].secBody?.content ?? '',
          height: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .18,
            tablet: centerOfTheGlobe * .18,
            desktop: centerOfTheGlobe * .18,
          ),
          width: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .05,
            tablet: centerOfTheGlobe * .05,
            desktop: centerOfTheGlobe * .05,
          ),
        ),
      ),
      Positioned(
        left: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe,
          tablet: centerOfTheGlobe * .35,
          desktop: centerOfTheGlobe * .35,
        ),
        bottom: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .25,
          tablet: centerOfTheGlobe * .25,
          desktop: centerOfTheGlobe * .25,
        ),
        child: indiaHoverWidget(
          state: state,
          location: StringConst.india,
          heading: state.locationsData?.secCard?[3].secBody?.header ?? '',
          address: state.locationsData?.secCard?[3].secBody?.content ?? '',
          height: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .30,
            tablet: centerOfTheGlobe * .30,
            desktop: centerOfTheGlobe * .30,
          ),
          width: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .25,
            tablet: centerOfTheGlobe * .25,
            desktop: centerOfTheGlobe * .25,
          ),
        ),
      ),
      Positioned(
        right: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .28,
          tablet: centerOfTheGlobe * .28,
          desktop: centerOfTheGlobe * .28,
        ),
        bottom: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .10,
          tablet: centerOfTheGlobe * .10,
          desktop: centerOfTheGlobe * .10,
        ),
        child: singaporeHoverWidget(
          state: state,
          location: StringConst.singapore,
          heading: state.locationsData?.secCard?[0].secBody?.header ?? '',
          address: state.locationsData?.secCard?[0].secBody?.content ?? '',
          subtitle: state.locationsData?.secCard?[0].secBody?.subtitle ?? '',
          height: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .10,
            tablet: centerOfTheGlobe * .10,
            desktop: centerOfTheGlobe * .10,
          ),
          width: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .05,
            tablet: centerOfTheGlobe * .05,
            desktop: centerOfTheGlobe * .05,
          ),
        ),
      ),
      Positioned(
        right: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .31,
          tablet: centerOfTheGlobe * .31,
          desktop: centerOfTheGlobe * .31,
        ),
        bottom: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .10,
          tablet: centerOfTheGlobe * .10,
          desktop: centerOfTheGlobe * .10,
        ),
        child: malaysiaHoverWidget(
          state: state,
          location: StringConst.malaysia,
          heading: state.locationsData?.secCard?[1].secBody?.header ?? '',
          address: state.locationsData?.secCard?[1].secBody?.content ?? '',
          subtitle: state.locationsData?.secCard?[1].secBody?.subtitle ?? '',
          height: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .15,
            tablet: centerOfTheGlobe * .15,
            desktop: centerOfTheGlobe * .15,
          ),
          width: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .05,
            tablet: centerOfTheGlobe * .05,
            desktop: centerOfTheGlobe * .05,
          ),
        ),
      ),
    ];
  }

  String _getImage(String country) {
    switch (country) {
      case "singapore":
        return '/data/uploads/Contact%20Us/map_latest_23/Singapore-HQ.webp';
      case "malaysia":
        return '/data/uploads/Contact%20Us/map_latest_23/Component%20103.webp';
      case "uae":
        return '/data/uploads/Contact%20Us/map_latest_23/UAE.webp';
      case "india":
        return '/data/uploads/Contact%20Us/map_latest_23/India.webp';
      default:
        return '/data/uploads/Contact%20Us/map_latest_23/Asia.webp';
    }
  }

  Widget uaeHoverWidget({
    required ContactUsState state,
    required String location,
    required String heading,
    required String address,
    required double height,
    required double width,
  }) {
    return Row(
      children: [
        MouseRegion(
          onEnter: (_) {
            context
                .read<ContactUsBloc>()
                .add(SelectCountryEvent(country: location));
          },
          onExit: (_) {
            context.read<ContactUsBloc>().add(SelectCountryEvent(country: ''));
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
        state.selectedCountry == location
            ? AddressTile(
                addressText: address,
                headingText: heading,
                locationText: '',
                height: 150,
              )
            : Container(
                height: 150,
                color: AppColors.transparent,
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
  }) {
    return Stack(
      children: [
        Positioned(
          child: state.selectedCountry == location
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddressTile(
                      addressText: address,
                      headingText: heading,
                      locationText: '',
                      height: 180,
                    ),
                  ],
                )
              : Container(
                  height: 150,
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
            context.read<ContactUsBloc>().add(SelectCountryEvent(country: ''));
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
        MouseRegion(
          onEnter: (_) {
            context
                .read<ContactUsBloc>()
                .add(SelectCountryEvent(country: location));
          },
          onExit: (_) {
            context.read<ContactUsBloc>().add(SelectCountryEvent(country: ''));
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
        // Gap(250),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        state.selectedCountry == location
            ? Column(
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
                height: 170,
                width: 10,
                color: AppColors.transparent,
              ),
        MouseRegion(
          onEnter: (_) {
            context
                .read<ContactUsBloc>()
                .add(SelectCountryEvent(country: location));
          },
          onExit: (_) {
            context.read<ContactUsBloc>().add(SelectCountryEvent(country: ''));
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
    );
  }
}
