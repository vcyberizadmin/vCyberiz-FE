// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/headers_bloc/headers_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/data/model/headers_model/headers_model.dart';
import 'package:vcyberiz/routes/route_constants.dart';

class NavigationMenuIcon extends StatefulWidget {
  const NavigationMenuIcon({super.key});

  @override
  State<NavigationMenuIcon> createState() => _NavigationMenuIconState();
}

class _NavigationMenuIconState extends State<NavigationMenuIcon>
    with SingleTickerProviderStateMixin {
  final GlobalKey menuKey = GlobalKey();
  ValueNotifier<OverlayEntry?> overlayEntry = ValueNotifier(null);

  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  String? expandedTileLabel;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _sizeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  void removeOverlay() async {
    context.read<HeadersBloc>().add(const CloseEvent());
    await _controller.reverse();
    overlayEntry.value?.remove();
    overlayEntry.value = null;
  }

  void showNavigationOverlay() {
    final RenderBox renderBox =
        menuKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final double top = offset.dy + renderBox.size.height + 16;

    overlayEntry.value = OverlayEntry(
      builder: (context) {
        final double adjustedTop = getValueForScreenType(
          context: context,
          mobile: top,
          tablet: top,
          desktop: top + 30,
        );

        return Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: adjustedTop,
              bottom: 0,
              child: GestureDetector(
                onTap: removeOverlay,
                behavior: HitTestBehavior.translucent,
                child: Container(color: Colors.black54),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: adjustedTop,
              child: Material(
                color: Colors.white,
                elevation: 4,
                child: SizeTransition(
                  sizeFactor: _sizeAnimation,
                  axisAlignment: -1.0,
                  child: BlocBuilder<HeadersBloc, HeadersState>(
                    builder: (context, state) {
                      final navItems = state.data?.navs?.navigations ?? [];
                      final navWithInnerPage =
                          state.data?.navs?.navWithInnerPage ?? [];

                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: Constants.height * 0.5,
                        ),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...navItems.map((nav) {
                                if (nav.label == StringConst.services ||
                                    nav.label == StringConst.solutions ||
                                    nav.label == StringConst.aboutUs) {
                                  final navData = navWithInnerPage.firstWhere(
                                    (n) => n.secHeader == nav.label,
                                    orElse: () =>
                                        NavWithInnerPage(navSubCard: []),
                                  );

                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                        dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      initiallyExpanded:
                                          expandedTileLabel == nav.label,
                                      onExpansionChanged: (expanded) {
                                        setState(() {
                                          expandedTileLabel =
                                              expanded ? nav.label : null;
                                        });
                                      },
                                      iconColor: AppColors.fontBlack,
                                      title: kStyle.med(
                                        text: nav.label ?? '',
                                        size: 16,
                                        color: AppColors.fontBlack,
                                      ),
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            if ((nav.label ?? '') ==
                                                StringConst.services) {
                                              context.goNamed(
                                                  RouteConstants.servicesPath);
                                            } else if ((nav.label ?? '') ==
                                                StringConst.solutions) {
                                              context.goNamed(
                                                  RouteConstants.servicesPath);
                                            } else {
                                              context.goNamed(
                                                  RouteConstants.aboutUsPath);
                                            }
                                            removeOverlay();
                                          },
                                          contentPadding: const EdgeInsets.only(
                                              left: 16, right: 32),
                                          title: kStyle.reg(
                                            text: nav.label ?? '',
                                            size: 16,
                                            color: AppColors.fontBlack,
                                          ),
                                          trailing: const Icon(
                                            Icons.arrow_forward,
                                            size: 16,
                                            color: AppColors.fontBlack,
                                          ),
                                        ),
                                        ...navData.navSubCard!.map((subCard) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if ((subCard.secSubHeader ?? '')
                                                  .isNotEmpty)
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 8),
                                                  child: kStyle.reg(
                                                    text:
                                                        subCard.secSubHeader ??
                                                            '',
                                                    size: 14,
                                                    color: AppColors.fontBlack,
                                                  ),
                                                ),
                                              ...subCard.secSubCard!
                                                  .expand((secSub) {
                                                return secSub.secCta!
                                                    .map((cta) {
                                                  return ListTile(
                                                    onTap: () {
                                                      final label =
                                                          cta.label ?? '';
                                                      final href =
                                                          cta.href ?? '';
                                                      if (label case 'Career') {
                                                        context.goNamed(
                                                          RouteConstants
                                                              .careerScreenPath,
                                                        );
                                                      } else if (label
                                                          case 'Partners') {
                                                        context.goNamed(
                                                          RouteConstants
                                                              .partnersScreenPath,
                                                        );
                                                      } else if (label
                                                          case 'Cyber Maturity Assessment (CMA)') {
                                                        context.goNamed(
                                                            RouteConstants
                                                                .cyberMeturityPath,
                                                            queryParameters: {
                                                              'id': href
                                                            });
                                                      } else if (label
                                                          case 'Intelligence-Led PT') {
                                                        context.goNamed(
                                                            RouteConstants
                                                                .penitraionTestingPath,
                                                            queryParameters: {
                                                              'id': href
                                                            });
                                                      } else if (label
                                                          case 'M365 Security Posture Advisory') {
                                                        context.goNamed(
                                                            RouteConstants
                                                                .postureAdvisoryPath,
                                                            queryParameters: {
                                                              'id': href
                                                            });
                                                      } else if (label
                                                          case 'Managed 365 Security') {
                                                        context.goNamed(
                                                            RouteConstants
                                                                .managedSecurityPath,
                                                            queryParameters: {
                                                              'id': href
                                                            });
                                                      } else if (label
                                                          case 'M365 Security Implementation') {
                                                        context.goNamed(
                                                            RouteConstants
                                                                .securityImplementationPath,
                                                            queryParameters: {
                                                              'id': href
                                                            });
                                                      } else if (label
                                                          case 'vShieId') {
                                                        context.goNamed(
                                                            RouteConstants
                                                                .vshieldPath,
                                                            queryParameters: {
                                                              'id': href
                                                            });
                                                      } else if (label
                                                          case 'vArmor') {
                                                        context.goNamed(
                                                            RouteConstants
                                                                .varmorPath,
                                                            queryParameters: {
                                                              'id': href
                                                            });
                                                      } else if (label
                                                          case 'vProtect') {
                                                        context.goNamed(
                                                            RouteConstants
                                                                .vprotectPath,
                                                            queryParameters: {
                                                              'id': href
                                                            });
                                                      } else if (label
                                                          case 'vRespond') {
                                                        context.goNamed(
                                                            RouteConstants
                                                                .vrespondPath,
                                                            queryParameters: {
                                                              'id': href
                                                            });
                                                      } else {
                                                        context.goNamed(
                                                          RouteConstants
                                                              .errorPath,
                                                        );
                                                      }

                                                      removeOverlay();
                                                    },
                                                    title: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.circle,
                                                          size: 4,
                                                          color: AppColors
                                                              .textBlueColor,
                                                        ),
                                                        const SizedBox(
                                                            width: 8),
                                                        kStyle.reg(
                                                          text: cta.label ?? '',
                                                          size: 14,
                                                          color: AppColors
                                                              .textBlueColor,
                                                        ),
                                                        Gap(5),
                                                        const Icon(
                                                          Icons.arrow_forward,
                                                          size: 16,
                                                          color: AppColors
                                                              .textBlueColor,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                              }),
                                            ],
                                          );
                                        }),
                                      ],
                                    ),
                                  );
                                } else {
                                  return ListTile(
                                    onTap: () {
                                      if (nav.label == 'Resources') {
                                        context.goNamed(
                                            RouteConstants.resourcePath);
                                      }
                                      removeOverlay();
                                    },
                                    title: kStyle.med(
                                      text: nav.label ?? '',
                                      size: 16,
                                      color: AppColors.fontBlack,
                                    ),
                                  );
                                }
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(overlayEntry.value!);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    overlayEntry.value?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: menuKey,
      onTap: () {
        if (overlayEntry.value == null) {
          showNavigationOverlay();
        } else {
          removeOverlay();
        }
      },
      child: SizedBox(
        height: 30,
        width: 25,
        child: ValueListenableBuilder<OverlayEntry?>(
          valueListenable: overlayEntry,
          builder: (context, value, child) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },
              child: SvgPicture.asset(
                value == null ? AssetConst.menuIcon : AssetConst.closeIcon,
                key: ValueKey(value == null ? 'menu' : 'close'),
              ),
            );
          },
        ),
      ),
    );
  }
}
