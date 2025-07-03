import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/cookies_bloc/cookies_bloc.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';
import 'package:vcyberiz/data/model/cookies_model/cookies_model.dart';

class TableOfContentsWidget extends StatefulWidget {
  final List<CookiesContent>? items;
  final Map<String, GlobalKey> sectionKeys;
  final Function(GlobalKey) onTapSection;
  final int currentIndex;

  const TableOfContentsWidget({
    super.key,
    required this.items,
    required this.sectionKeys,
    required this.onTapSection,
    required this.currentIndex,
  });

  @override
  State<TableOfContentsWidget> createState() => _TableOfContentsWidgetState();
}

class _TableOfContentsWidgetState extends State<TableOfContentsWidget> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return SizedBox(
        width: sizingInformation.isDesktop ? 220 : null,
        // color: const Color(0xFFF1F4F8),
        // padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Kstyles().bold(
              text: StringConst.tableOfContents,
              size: 16,
              color: AppColors.black,
            ),
            const SizedBox(height: 16),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.items?.length ?? 0,
                itemBuilder: (context, index) {
                  if (index == 0) return const SizedBox(); // Skip first
                  final item = widget.items![index];
                  final keyId =
                      (item.secHeader ?? '').toLowerCase().replaceAll(' ', '_');
                  final number = index + 1;

                  final bool isActive = widget.currentIndex == index;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          context
                              .read<CookiesBloc>()
                              .add(UpdateIndexEvent(index));
                          widget.onTapSection(widget.sectionKeys[keyId]!);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Kstyles().reg(
                            text: '${number - 1}. ${item.secHeader ?? ''}',
                            size: 14,
                            color: !isActive ? AppColors.blue : AppColors.black,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                      Divider(
                        color: isActive ? AppColors.black : Colors.grey,
                        thickness: isActive ? 2 : 1,
                        height: 8,
                      ),
                    ],
                  );
                }),
          ],
        ),
      );
    });
  }
}
