// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/contact_us_bloc/contact_us_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
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
                  physics: NeverScrollableScrollPhysics(),
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
                          height: 120),
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
                          Container(
                            height: getValueForScreenType<double>(
                              context: context,
                              mobile: Constants.width * .96,
                              tablet: Constants.width * .4,
                              desktop: Constants.desktopBreakPoint * .45,
                            ),
                            color: AppColors.transparent,
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
                                      child: Image.asset(
                                        _getImage(''),
                                        key: ValueKey(_getImage('')),
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Visibility(
                                      visible: state.selectedCountry ==
                                          StringConst.uae,
                                      child: Image.asset(
                                        _getImage(StringConst.uae),
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
                                      child: Image.asset(
                                        _getImage(StringConst.india),
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
                                      child: Image.asset(
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
                                      child: Image.asset(
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
          mobile: centerOfTheGlobe * .27,
          tablet: centerOfTheGlobe * .27,
          desktop: centerOfTheGlobe * .27,
        ),
        bottom: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .32,
          tablet: centerOfTheGlobe * .22,
          desktop: centerOfTheGlobe * .25,
        ),
        child: uaeHoverWidget(
          state: state,
          location: StringConst.uae,
          heading: state.locationsData?.secCard?[2].secBody?.header ?? '',
          address: state.locationsData?.secCard?[2].secBody?.content ?? '',
          height: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .18,
            tablet: centerOfTheGlobe * .07,
            desktop: centerOfTheGlobe * .07,
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
          mobile: centerOfTheGlobe * 40,
          tablet: centerOfTheGlobe * .40,
          desktop: centerOfTheGlobe * .40,
        ),
        bottom: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .25,
          tablet: centerOfTheGlobe * .17,
          desktop: centerOfTheGlobe * .17,
        ),
        child: indiaHoverWidget(
          state: state,
          location: StringConst.india,
          heading: state.locationsData?.secCard?[3].secBody?.header ?? '',
          address: state.locationsData?.secCard?[3].secBody?.content ?? '',
          height: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .35,
            tablet: centerOfTheGlobe * .2,
            desktop: centerOfTheGlobe * .2,
          ),
          width: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .15,
            tablet: centerOfTheGlobe * .17,
            desktop: centerOfTheGlobe * .17,
          ),
        ),
      ),
      Positioned(
        right: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .37,
          tablet: centerOfTheGlobe * .25,
          desktop: centerOfTheGlobe * .25,
        ),
        bottom: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .15,
          tablet: centerOfTheGlobe * .11,
          desktop: centerOfTheGlobe * .12,
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
            tablet: centerOfTheGlobe * .06,
            desktop: centerOfTheGlobe * .06,
          ),
          width: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .05,
            tablet: centerOfTheGlobe * .15,
            desktop: centerOfTheGlobe * .15,
          ),
        ),
      ),
      Positioned(
        right: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .35,
          tablet: centerOfTheGlobe * .35,
          desktop: centerOfTheGlobe * .35,
        ),
        bottom: getValueForScreenType(
          context: context,
          mobile: centerOfTheGlobe * .15,
          tablet: centerOfTheGlobe * .11,
          desktop: centerOfTheGlobe * .11,
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
            tablet: centerOfTheGlobe * .05,
            desktop: centerOfTheGlobe * .05,
          ),
          width: getValueForScreenType(
            context: context,
            mobile: centerOfTheGlobe * .05,
            tablet: centerOfTheGlobe * .04,
            desktop: centerOfTheGlobe * .04,
          ),
        ),
      ),
    ];
  }

  String _getImage(String country) {
    switch (country) {
      case "singapore":
        return AssetConst.singapore;
      case "malaysia":
        return AssetConst.malaysia;
      case "uae":
        return AssetConst.uae;
      case "india":
        return AssetConst.india;
      default:
        return AssetConst.asia;
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
                height: 100,
              )
            : Container(
                height: 100,
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
        SizedBox(
          height: height,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: state.selectedCountry == location
                ? AddressTile(
                    addressText: address,
                    headingText: heading,
                    locationText: '',
                    height: 100,
                  )
                : Container(
                    height: 100,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        state.selectedCountry == location
            ? AddressTile(
                addressText: address,
                headingText: heading,
                locationText: subtitle,
                height: 100,
              )
            : Container(
                height: 100,
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
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        state.selectedCountry == location
            ? Column(
                children: [
                  AddressTile(
                    addressText: address,
                    headingText: heading,
                    locationText: subtitle,
                    height: 120,
                  ),
                ],
              )
            : Container(
                height: 120,
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
