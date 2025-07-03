// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';

import '../../../bloc/privacy_bloc/privacy_bloc.dart';

class PolicyPoints extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;
  const PolicyPoints({
    super.key,
    required this.sectionKeys,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyBloc, PrivacyState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.data?.privacyPolicy?.length ?? 0,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final data = state.data?.privacyPolicy?[index];
                final id = (data?.privPolicyPointsHd ?? '')
                    .toLowerCase()
                    .replaceAll(' ', '_');
                return KeyedSubtree(
                  key: sectionKeys[id],
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Kstyles().bold(
                          text: data?.privPolicyPointsHd ?? '',
                          size: getValueForScreenType(
                            context: context,
                            mobile: 12,
                            desktop: 16,
                            tablet: 13,
                          ),
                        ),
                        if (data?.privPolicyPointsCont != null) ...[
                          const Gap(24),
                          Kstyles().med(
                            overflow: TextOverflow.visible,
                            text: data?.privPolicyPointsCont ?? '',
                            size: getValueForScreenType(
                              context: context,
                              mobile: 12,
                              desktop: 15,
                              tablet: 13,
                            ),
                          ),
                        ],
                        if (data?.privPolicyPointsList != null)
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data?.privPolicyPointsList?.length ?? 0,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              final subData =
                                  data?.privPolicyPointsList?[index];

                              return Padding(
                                padding: const EdgeInsets.only(
                                  top: 24,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Kstyles().bold(
                                      text: subData?.privPolicySubHd ?? '',
                                      size: getValueForScreenType(
                                        context: context,
                                        mobile: 12,
                                        desktop: 16,
                                        tablet: 13,
                                      ),
                                    ),
                                    const Gap(24),
                                    Kstyles().med(
                                      overflow: TextOverflow.visible,
                                      text: subData?.privPolicySubCont ?? '',
                                      size: getValueForScreenType(
                                        context: context,
                                        mobile: 12,
                                        desktop: 15,
                                        tablet: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        if (data?.privPolicySubPoints != null)
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 24),
                            itemCount: data?.privPolicySubPoints?.length ?? 0,
                            itemBuilder: (context, index) {
                              final subData = data?.privPolicySubPoints?[index];
                              final subId = (subData?.privPolicySubHd ?? '')
                                  .toLowerCase()
                                  .replaceAll(' ', '_');

                              return KeyedSubtree(
                                key: sectionKeys[subId],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (subData?.privPolicySubHd != null) ...[
                                      Gap(8),
                                      Kstyles().bold(
                                        text: subData?.privPolicySubHd ?? '',
                                        size: getValueForScreenType(
                                          context: context,
                                          mobile: 12,
                                          desktop: 16,
                                          tablet: 13,
                                        ),
                                      ),
                                    ],
                                    if (subData?.privPolicySubCont != null) ...[
                                      Gap(8),
                                      Kstyles().med(
                                        overflow: TextOverflow.visible,
                                        text: subData?.privPolicySubCont ?? '',
                                        size: getValueForScreenType(
                                          context: context,
                                          mobile: 12,
                                          desktop: 15,
                                          tablet: 13,
                                        ),
                                      ),
                                    ],
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          subData?.privPolicySubList?.length ??
                                              0,
                                      padding: EdgeInsets.only(top: 24),
                                      itemBuilder: (context, index) {
                                        final subPointData =
                                            subData?.privPolicySubList?[index];
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Kstyles().bold(
                                                text: '• ',
                                                size: getValueForScreenType(
                                                  context: context,
                                                  mobile: 12,
                                                  desktop: 16,
                                                  tablet: 13,
                                                ),
                                              ),
                                              const Gap(10),
                                              Expanded(
                                                child: Kstyles().med(
                                                    text: subPointData?.text ??
                                                        '',
                                                    size: getValueForScreenType(
                                                      context: context,
                                                      mobile: 12,
                                                      desktop: 16,
                                                      tablet: 13,
                                                    ),
                                                    overflow:
                                                        TextOverflow.visible),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Gap(getValueForScreenType(
                context: context, mobile: 30, desktop: 80, tablet: 50)),
          ],
        );
      },
    );
  }
}
