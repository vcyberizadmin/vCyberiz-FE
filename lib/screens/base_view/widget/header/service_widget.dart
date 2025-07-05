// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/data/model/headers_model/headers_model.dart';
import 'package:vcyberiz/routes/route_constants.dart';

class ServicesDropdown extends StatefulWidget {
  final NavWithInnerPage? data;
  final VoidCallback? onClose;

  const ServicesDropdown({super.key, this.data, this.onClose});

  @override
  State<ServicesDropdown> createState() => _ServicesDropdownState();
}

class _ServicesDropdownState extends State<ServicesDropdown> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            bottom: 60,
            top: 20,
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      widget.onClose?.call();
                      if ((widget.data?.secHeader ?? '') ==
                          StringConst.services) {
                        context.goNamed(RouteConstants.servicesPath);
                      } else if ((widget.data?.secHeader ?? '') ==
                          StringConst.solutions) {
                        context.goNamed(RouteConstants.solutionsPath);
                      } else {
                        context.goNamed(RouteConstants.aboutUsPath);
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        kStyle.bold(
                          text: widget.data?.secHeader ?? '',
                        ),
                        Gap(20),
                        Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Gap(20),
              if (((widget.data?.navSubCard ?? [])[0].secSubHeader ?? '') != '')
                Row(
                  children: List.generate(
                      (widget.data?.navSubCard ?? []).length, (index) {
                    final selected = index == selectedTabIndex;
                    return Column(
                      children: [
                        InkWell(
                          onTap: () => setState(() => selectedTabIndex = index),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: kStyle.semiBold(
                                  text: (widget.data?.navSubCard ?? [])[index]
                                          .secSubHeader ??
                                      '',
                                  color: selected
                                      ? _hexToColor(
                                          widget.data?.colorIdentifier1 ?? '')
                                      : Colors.black,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                height: 1,
                                width: 250,
                                color: selected
                                    ? _hexToColor(
                                        widget.data?.colorIdentifier1 ?? '')
                                    : AppColors.greyBorder,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              if (((widget.data?.navSubCard ?? [])[0].secSubHeader ?? '') != '')
                Gap(20),
              ((widget.data?.secHeader ?? '') == StringConst.services)
                  ? Row(
                      children: [
                        Wrap(
                          spacing: 40,
                          children: [
                            ...((widget.data?.navSubCard ??
                                            [])[selectedTabIndex]
                                        .secSubCard ??
                                    [])
                                .map((item) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  kStyle.reg(
                                    text: item.secLabel ?? '',
                                    size: 14,
                                    color: AppColors.davysGray,
                                  ),
                                  Gap(
                                    10,
                                  ),
                                  ...(item.secCta ?? []).map((item) {
                                    return InkWell(
                                      onTap: () {
                                        widget.onClose?.call();

                                        if ((item.label ?? '') ==
                                            'Cyber Maturity Assessment (CMA)') {
                                          context.goNamed(
                                            RouteConstants.cyberMeturityPath,
                                            queryParameters: {
                                              'id': item.href ?? '',
                                            },
                                          );
                                        }
                                        if ((item.label ?? '') ==
                                            'Intelligence-Led PT') {
                                          context.goNamed(
                                            RouteConstants
                                                .penitraionTestingPath,
                                            queryParameters: {
                                              'id': item.href ?? '',
                                            },
                                          );
                                        }
                                        if ((item.label ?? '') ==
                                            'M365 Security Posture Advisory') {
                                          context.goNamed(
                                            RouteConstants.postureAdvisoryPath,
                                            queryParameters: {
                                              'id': item.href ?? '',
                                            },
                                          );
                                        }
                                        if ((item.label ?? '') ==
                                            'Managed 365 Security') {
                                          context.goNamed(
                                            RouteConstants.managedSecurityPath,
                                            queryParameters: {
                                              'id': item.href ?? '',
                                            },
                                          );
                                        }
                                        if ((item.label ?? '') ==
                                            'M365 Security Implementation') {
                                          context.goNamed(
                                            RouteConstants
                                                .securityImplementationPath,
                                            queryParameters: {
                                              'id': item.href ?? '',
                                            },
                                          );
                                        }
                                        if ((item.label ?? '') == 'vShieId') {
                                          context.goNamed(
                                            RouteConstants.vshieldPath,
                                            queryParameters: {
                                              'id': item.href ?? '',
                                            },
                                          );
                                        }
                                        if ((item.label ?? '') == 'vArmor') {
                                          context.goNamed(
                                            RouteConstants.varmorPath,
                                            queryParameters: {
                                              'id': item.href ?? '',
                                            },
                                          );
                                        }
                                        if ((item.label ?? '') == 'vProtect') {
                                          context.goNamed(
                                            RouteConstants.vprotectPath,
                                            queryParameters: {
                                              'id': item.href ?? '',
                                            },
                                          );
                                        }
                                        if ((item.label ?? '') == 'vRespond') {
                                          context.goNamed(
                                            RouteConstants.vrespondPath,
                                            queryParameters: {
                                              'id': item.href ?? '',
                                            },
                                          );
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 5,
                                            width: 5,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.blue,
                                            ),
                                          ),
                                          Gap(5),
                                          kStyle.reg(
                                            text: item.label ?? '',
                                            color: AppColors.blue,
                                            size: 14,
                                            overflow: TextOverflow.visible,
                                          ),
                                          Gap(10),
                                          Icon(
                                            Icons.arrow_forward,
                                            size: 20,
                                            color: AppColors.blue,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                                ],
                              );
                            }),
                          ],
                        ),
                      ],
                    )
                  : ((widget.data?.secHeader ?? '') == StringConst.solutions)
                      ? Column(
                          spacing: 20,
                          children: [
                            ...((widget.data?.navSubCard ??
                                            [])[selectedTabIndex]
                                        .secSubCard ??
                                    [])
                                .map((item) {
                              return InkWell(
                                onTap: () {
                                  widget.onClose?.call();
                                  if ((item.secCta?.first.label ?? '') ==
                                      'Cyber Maturity Assessment (CMA)') {
                                    context.goNamed(
                                      RouteConstants.cyberMeturityPath,
                                      queryParameters: {
                                        'id': item.secCta?.first.href ?? '',
                                      },
                                    );
                                  }
                                  if ((item.secCta?.first.label ?? '') ==
                                      'Intelligence-Led PT') {
                                    context.goNamed(
                                      RouteConstants.penitraionTestingPath,
                                      queryParameters: {
                                        'id': item.secCta?.first.href ?? '',
                                      },
                                    );
                                  }
                                  if ((item.secCta?.first.label ?? '') ==
                                      'M365 Security Posture Advisory') {
                                    context.goNamed(
                                      RouteConstants.postureAdvisoryPath,
                                      queryParameters: {
                                        'id': item.secCta?.first.href ?? '',
                                      },
                                    );
                                  }
                                  if ((item.secCta?.first.label ?? '') ==
                                      'Managed 365 Security') {
                                    context.goNamed(
                                      RouteConstants.managedSecurityPath,
                                      queryParameters: {
                                        'id': item.secCta?.first.href ?? '',
                                      },
                                    );
                                  }
                                  if ((item.secCta?.first.label ?? '') ==
                                      'M365 Security Implementation') {
                                    context.goNamed(
                                      RouteConstants.securityImplementationPath,
                                      queryParameters: {
                                        'id': item.secCta?.first.href ?? '',
                                      },
                                    );
                                  }
                                  if ((item.secCta?.first.label ?? '') ==
                                      'vShieId') {
                                    context.goNamed(
                                      RouteConstants.vshieldPath,
                                      queryParameters: {
                                        'id': item.secCta?.first.href ?? '',
                                      },
                                    );
                                  }
                                  if ((item.secCta?.first.label ?? '') ==
                                      'vArmor') {
                                    context.goNamed(
                                      RouteConstants.varmorPath,
                                      queryParameters: {
                                        'id': item.secCta?.first.href ?? '',
                                      },
                                    );
                                  }
                                  if ((item.secCta?.first.label ?? '') ==
                                      'vProtect') {
                                    context.goNamed(
                                      RouteConstants.vprotectPath,
                                      queryParameters: {
                                        'id': item.secCta?.first.href ?? '',
                                      },
                                    );
                                  }
                                  if ((item.secCta?.first.label ?? '') ==
                                      'vRespond') {
                                    context.goNamed(
                                      RouteConstants.vrespondPath,
                                      queryParameters: {
                                        'id': item.secCta?.first.href ?? '',
                                      },
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 5,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.blue,
                                      ),
                                    ),
                                    Gap(5),
                                    kStyle.reg(
                                      text: item.secCta?.first.label ?? '',
                                      color: AppColors.blue,
                                      size: 14,
                                      overflow: TextOverflow.visible,
                                    ),
                                    Gap(10),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 20,
                                      color: AppColors.blue,
                                    )
                                  ],
                                ),
                              );
                            }),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            ...((widget.data?.navSubCard ??
                                            [])[selectedTabIndex]
                                        .secSubCard ??
                                    [])
                                .map((item) {
                              return InkWell(
                                onTap: () {
                                  widget.onClose?.call();

                                  if ((item.secCta?.first.label ?? '') ==
                                      'Career') {
                                    context.goNamed(
                                      RouteConstants.careerScreenPath,
                                    );
                                  }
                                  if ((item.secCta?.first.label ?? '') ==
                                      'Partners') {
                                    context.goNamed(
                                      RouteConstants.partnersScreenPath,
                                    );
                                  }
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 5,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.blue,
                                      ),
                                    ),
                                    Gap(5),
                                    kStyle.reg(
                                      text: item.secCta?.first.label ?? '',
                                      color: AppColors.blue,
                                      size: 14,
                                      overflow: TextOverflow.visible,
                                    ),
                                    Gap(10),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 20,
                                      color: AppColors.blue,
                                    )
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
            ],
          ),
        ),
      ],
    );
  }

  Color _hexToColor(String hexCode) {
    final hex = hexCode.replaceAll("#", "");
    return Color(int.parse("FF$hex", radix: 16));
  }
}
