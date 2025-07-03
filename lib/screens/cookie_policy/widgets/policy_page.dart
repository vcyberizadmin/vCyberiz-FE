import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vcyberiz/bloc/cookies_bloc/cookies_bloc.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';
import 'package:vcyberiz/data/model/cookies_model/cookies_model.dart';

class PolicyPoints extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;
  final List<CookiesContent> cookiesList;

  const PolicyPoints({
    super.key,
    required this.sectionKeys,
    required this.cookiesList,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CookiesBloc, CookiesState>(
      builder: (context, state) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Kstyles().reg(
            text: state.data?.secContent?.first.children?.first.text ?? '',
            size: 14,
            overflow: TextOverflow.visible,
          ),
          ...List.generate(cookiesList.length, (index) {
            final item = cookiesList[index];
            final id =
                (item.secHeader ?? '').toLowerCase().replaceAll(' ', '_');

            return KeyedSubtree(
              key: sectionKeys[id],
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Kstyles().bold(
                      text: item.secHeader ?? '',
                      size: 18,
                      overflow: TextOverflow.visible,
                    ),
                    const Gap(24),
                    Kstyles().reg(
                      text: item.cookiesContent ?? '',
                      size: 14,
                      overflow: TextOverflow.visible,
                    ),
                    ...List.generate(item.cookiesSubPoints?.length ?? 0,
                        (subIndex) {
                      final sub = item.cookiesSubPoints![subIndex];
                      return Padding(
                        padding: const EdgeInsets.only(left: 16, top: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 3,
                                  backgroundColor: AppColors.black,
                                ),
                                const SizedBox(width: 10),
                                Kstyles().reg(
                                  text: sub.secHeader ?? '',
                                  size: 14,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Kstyles().reg(
                                text: sub.secContent ?? '',
                                size: 14,
                                overflow: TextOverflow.visible,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
        ]);
      },
    );
    // return SizedBox(
    //   width: Constants.width,
    //   child: SizedBox(
    //     width: getValueForScreenType<double>(
    //       context: context,
    //       mobile: Constants.width * 0.92,
    //       tablet: Constants.width * 0.92,
    //       desktop: Constants.desktopBreakPoint,
    //     ),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         // LEFT: Scrollable PolicyPoints
    //         Expanded(
    //           flex: 4,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: List.generate(cookiesList.length, (index) {
    //               final item = cookiesList[index];
    //               final id =
    //                   (item.secHeader ?? '').toLowerCase().replaceAll(' ', '_');

    //               return KeyedSubtree(
    //                 key: sectionKeys[id],
    //                 child: Padding(
    //                   padding: const EdgeInsets.symmetric(vertical: 20),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Kstyles().bold(
    //                         text: item.secHeader ?? '',
    //                         size: 18,
    //                         overflow: TextOverflow.visible,
    //                       ),
    //                       const Gap(10),
    //                       Kstyles().reg(
    //                         text: item.cookiesContent ?? '',
    //                         size: 14,
    //                         overflow: TextOverflow.visible,
    //                       ),
    //                       ...List.generate(item.cookiesSubPoints?.length ?? 0,
    //                           (subIndex) {
    //                         final sub = item.cookiesSubPoints![subIndex];
    //                         return Padding(
    //                           padding: const EdgeInsets.only(left: 15, top: 8),
    //                           child: Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Row(
    //                                 children: [
    //                                   const CircleAvatar(
    //                                     radius: 3,
    //                                     backgroundColor: AppColors.black,
    //                                   ),
    //                                   const SizedBox(width: 10),
    //                                   Kstyles().reg(
    //                                     text: sub.secHeader ?? '',
    //                                     size: 14,
    //                                     overflow: TextOverflow.visible,
    //                                   ),
    //                                 ],
    //                               ),
    //                               Padding(
    //                                 padding: const EdgeInsets.only(left: 13),
    //                                 child: Kstyles().reg(
    //                                   text: sub.secContent ?? '',
    //                                   size: 14,
    //                                   overflow: TextOverflow.visible,
    //                                 ),
    //                               )
    //                             ],
    //                           ),
    //                         );
    //                       }),
    //                     ],
    //                   ),
    //                 ),
    //               );
    //             }),
    //           ),
    //         ),
    //         SizedBox(
    //             width: getValueForScreenType(
    //           context: context,
    //           mobile: 0,
    //           tablet: 0,
    //           desktop: 300,
    //         )), // Spacer for TOC
    //       ],
    //     ),
    //   ),
    // );
  }
}
