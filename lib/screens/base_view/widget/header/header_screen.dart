// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/headers_bloc/headers_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_bloc.dart';
import 'package:vcyberiz/bloc/home-bloc/home_event.dart';
import 'package:vcyberiz/bloc/home-bloc/home_state.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/data/model/headers_model/headers_model.dart';
import 'package:vcyberiz/routes/route_constants.dart';
import 'package:vcyberiz/screens/base_view/widget/header/navigation_menu_icon_widget.dart';

import 'search_widget.dart';
import 'service_widget.dart';

class HeaderScreen extends StatelessWidget {
  final bool disableInteractions;
  const HeaderScreen({super.key, required this.disableInteractions});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeadersBloc, HeadersState>(
      builder: (context, state) {
        if (state.loading) {
          return const SizedBox();
        }
        return AbsorbPointer(
          absorbing: disableInteractions,
          child: Container(
            color: AppColors.white,
            width: Constants.width,
            child: Center(
              child: SizedBox(
                width: getValueForScreenType<double>(
                  context: context,
                  mobile: Constants.width * .96,
                  tablet: Constants.width * .92,
                  desktop: Constants.desktopBreakPoint,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //!-----(header bottom widget)

                      _headerBottomRowWidget(context, state),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _headerBottomRowWidget(
    BuildContext context,
    HeadersState state,
  ) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //!-----(logo)
          logoWidget(
            context,
            state,
            getValueForScreenType<double>(
              context: context,
              mobile: 100,
              tablet: 150,
              desktop: 150,
            ),
            50,
          ),
          //!-----(category list)
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop)
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 600,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.data?.navs?.navigations?.length,
                  itemBuilder: (context, index) {
                    Cta? data = state.data?.navs?.navigations?[index];
                    return _deskTopBottomItem(
                      context,
                      data?.label ?? '',
                      state,
                    );
                  },
                ),
              ),
            ),
          //!-----(lets talk)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              letsTalkWidget(context, state, false),
              Gap(getValueForScreenType<double>(
                context: context,
                mobile: 10,
                tablet: 20,
                desktop: 30,
              )),
              InkWell(
                onTap: () {
                  _showAlertBox(context);
                },
                child: SizedBox(
                  height: 25,
                  child: SvgPicture.asset(
                    AssetConst.search,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              Gap(getValueForScreenType<double>(
                context: context,
                mobile: 10,
                tablet: 10,
                desktop: 20,
              )),
              if (sizingInformation.deviceScreenType !=
                  DeviceScreenType.desktop)
                const NavigationMenuIcon(),
              const Gap(10)
            ],
          )
        ],
      );
    });
  }

  void _showAlertBox(BuildContext context) {
    TextEditingController searchTextController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.transparent,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          content: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return SizedBox(
                width: Constants.width * .7,
                height: Constants.height * 0.85,
                child: Column(
                  children: [
                    const Gap(100),
                    Container(
                      width: getValueForScreenType(
                        context: context,
                        mobile: Constants.width * 0.9,
                        tablet: Constants.width * 0.7,
                        desktop: Constants.width * 0.6,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          // Search field
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Stack(
                                    children: [
                                      // Gradient border
                                      ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return const LinearGradient(
                                            colors: AppColors.gradientColor,
                                          ).createShader(bounds);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white,
                                                width:
                                                    2), // gets overridden by shader
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(28),
                                          ),
                                          child: TextFormField(
                                            controller: searchTextController,
                                            autofocus: true,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              prefixIcon: const Icon(
                                                  Icons.search,
                                                  color: Colors.white),
                                              hintText: 'Search',
                                              hintStyle: const TextStyle(
                                                  color: Colors.white70),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: BorderSide.none,
                                              ),
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 14),
                                            ),
                                            onChanged: (value) {
                                              context.read<HomeBloc>().add(
                                                  GetSearchEvent(
                                                      searchText: value));
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Gap(20),
                              InkWell(
                                onTap: () {
                                  context.pop();
                                },
                                child: Icon(
                                  Icons.close,
                                  color: AppColors.white,
                                ),
                              )
                            ],
                          ),
                          const Gap(10),

                          // Make ListView scrollable
                          SearchResultsList(
                            hits: state.searchResults,
                            query: state.searchText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget logoWidget(
    BuildContext context,
    HeadersState state,
    double width,
    double height,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          context.goNamed(RouteConstants.homeScreenPath);
        },
        child: SizedBox(
          height: height,
          width: width,
          child: ImageWidget(
            imageUrl: state.data?.brandLogo?.url ?? '',
            label: state.data?.brandLogo?.label ?? '',
          ),
        ),
      ),
    );
  }

  Widget letsTalkWidget(
      BuildContext context, HeadersState state, bool showPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType<double>(
          context: context,
          mobile: showPadding ? 10 : 0,
          tablet: showPadding ? 10 : 0,
          desktop: 0,
        ),
      ),
      child: CustomButtonWidget(
        text: state.data?.navs?.cta?.label ?? '',
        onTap: () {
          context.goNamed(RouteConstants.contactUsScreenPath);
        },
        bgButtonColor: AppColors.darkOrangeColor,
        buttonHeight: 30,
        showIcon: true,
        textSize: getValueForScreenType<double>(
          context: context,
          mobile: 12,
          tablet: 12,
          desktop: 14,
        ),
        iconWidget: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.white,
          size: 15,
        ),
      ),
    );
  }

  Widget _servicerWidget({
    required String title,
    required HeadersState state,
    required BuildContext context,
  }) {
    final GlobalKey menuKey = GlobalKey();
    OverlayEntry? overlayEntry;

    void removeOverlay() {
      context.read<HeadersBloc>().add(const CloseEvent());

      overlayEntry?.remove();
      overlayEntry = null;
    }

    void showCustomOverlay() {
      final RenderBox renderBox =
          menuKey.currentContext!.findRenderObject() as RenderBox;
      final Offset offset = renderBox.localToGlobal(Offset.zero);
      final double left = offset.dx;
      final double top = offset.dy + renderBox.size.height + 8;

      overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            // Background tap detector to dismiss
            GestureDetector(
              onTap: removeOverlay,
              behavior: HitTestBehavior.translucent,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            // Your dropdown
            Positioned(
              left: getValueForScreenType(
                  context: context,
                  mobile: 10,
                  tablet: Constants.width * .5,
                  desktop: left),
              top: getValueForScreenType(
                context: context,
                mobile: top,
                tablet: top,
                desktop: top + 30,
              ),
              child: Material(
                elevation: 0,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: getValueForScreenType(
                      context: context,
                      mobile: Constants.width,
                      tablet: Constants.width * .5,
                      desktop: title == StringConst.services
                          ? 800
                          : title == StringConst.solutions
                              ? 700
                              : 600),
                  child: ServicesDropdown(
                    data: (title == StringConst.services
                        ? (state.data?.navs?.navWithInnerPage?.first)
                        : title == StringConst.solutions
                            ? (state.data?.navs?.navWithInnerPage?[1])
                            : (state.data?.navs?.navWithInnerPage?.last)),
                    onClose: removeOverlay, // <--- Pass the function here
                  ),
                ),
              ),
            ),
          ],
        ),
      );
      Overlay.of(context).insert(overlayEntry!);
    }

    return InkWell(
      key: menuKey,
      onTap: () {
        if (overlayEntry != null) {
          removeOverlay();
        } else {
          if (title == StringConst.services) {
            context.read<HeadersBloc>().add(const ServiceOnTapEvent());
          }
          if (title == StringConst.solutions) {
            context.read<HeadersBloc>().add(const SolutionOnTapEvent());
          }
          if (title == StringConst.aboutUs) {
            context.read<HeadersBloc>().add(const AboutUsOnTapEvent());
          }
          showCustomOverlay();
        }
      },
      child: Row(
        children: [
          kStyle.semiBold(
            text: title,
            color: AppColors.black,
            size: 14,
            overflow: TextOverflow.visible,
          ),
          if (title == StringConst.services ||
              title == StringConst.solutions ||
              title == StringConst.aboutUs)
            Icon(
              (title == StringConst.services && state.expandService) ||
                      (title == StringConst.solutions && state.expandSolution)
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: AppColors.black,
            )
        ],
      ),
    );
  }

  Widget _deskTopBottomItem(
    BuildContext context,
    String title,
    HeadersState state,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType<double>(
          context: context,
          mobile: 0,
          tablet: 0,
          desktop: 10,
        ),
        vertical: getValueForScreenType<double>(
          context: context,
          mobile: 0,
          tablet: 0,
          desktop: 10,
        ),
      ),
      child: title == StringConst.services ||
              title == StringConst.solutions ||
              title == StringConst.aboutUs
          ? _servicerWidget(
              title: title,
              state: state,
              context: context,
            )
          : InkWell(
              onTap: () {
                if (title == StringConst.services) {
                  context.read<HeadersBloc>().add(const ServiceOnTapEvent());
                }
                if (title == StringConst.solutions) {
                  context.read<HeadersBloc>().add(const SolutionOnTapEvent());
                }
                if (title == 'Resources') {
                  context.goNamed(RouteConstants.resourcePath);
                }

                if (title == StringConst.aboutUs) {
                  context.goNamed(RouteConstants.aboutUsPath);
                }
              },
              child: Row(
                children: [
                  kStyle.semiBold(
                    text: title,
                    color: AppColors.black,
                    size: 14,
                    overflow: TextOverflow.visible,
                    // textAlign: TextAlign.center,
                  ),
                  if (title == StringConst.services ||
                      title == StringConst.solutions)
                    Icon(
                      (title == StringConst.services && state.expandService) ||
                              (title == StringConst.solutions &&
                                  state.expandSolution)
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.black,
                    )
                ],
              ),
            ),
    );
  }
}
