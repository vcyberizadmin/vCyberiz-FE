import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcyberiz/bloc/privacy_bloc/privacy_bloc.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';
import 'package:vcyberiz/data/model/privacy_model/privacy_model.dart';

class TableOfContentsWidget extends StatefulWidget {
  final List<PrivacyPolicyList> policiesList;
  final Map<String, GlobalKey> sectionKeys;
  final Function(GlobalKey) onTapSection;
  final ScrollController tocScrollController;
  final double? footerHeight;

  const TableOfContentsWidget({
    super.key,
    required this.policiesList,
    required this.sectionKeys,
    required this.onTapSection,
    required this.tocScrollController,
    this.footerHeight,
  });

  @override
  State<TableOfContentsWidget> createState() => _TableOfContentsWidgetState();
}

class _TableOfContentsWidgetState extends State<TableOfContentsWidget> {
  final Map<String, GlobalKey> itemKeys = {};
  String? lastScrolledItem;

  String normalize(String title) => title.trim().toLowerCase();

  @override
  void initState() {
    super.initState();
    if (widget.policiesList.isNotEmpty) {
      _buildItemKeys();
    }
  }

  @override
  void didUpdateWidget(covariant TableOfContentsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.policiesList != widget.policiesList &&
        widget.policiesList.isNotEmpty) {
      _buildItemKeys();
    }
  }

  void _buildItemKeys() {
    itemKeys.clear();
    for (final parent in widget.policiesList) {
      final parentTitle = parent.privPolicyPointsHd ?? '';
      itemKeys[normalize(parentTitle)] = GlobalKey();
      for (final sub in parent.privPolicySubPoints ?? []) {
        final subTitle = sub.privPolicySubHd ?? '';
        itemKeys[normalize(subTitle)] = GlobalKey();
      }
    }
  }

  void _scrollToSelectedItem(String selectedItem) {
    final normalized = normalize(selectedItem);
    final key = itemKeys[normalized];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 300),
        alignment: 0.1,
      );
      lastScrolledItem = selectedItem;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyBloc, PrivacyState>(
      buildWhen: (prev, curr) => prev.selectedItem != curr.selectedItem,
      builder: (context, state) {
        final selectedItem = state.selectedItem;

        // Automatically scroll TOC when selectedItem changes
        if (selectedItem.isNotEmpty && selectedItem != lastScrolledItem) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _scrollToSelectedItem(selectedItem);
          });
        }

        return ListView(
          controller: widget.tocScrollController,
          padding: EdgeInsets.only(bottom: (widget.footerHeight ?? 0) + 100),
          children: [
            Kstyles().bold(
              text: StringConst.tableOfContents,
              size: 16,
              color: AppColors.grey,
            ),
            const SizedBox(height: 20),
            ...widget.policiesList.expand((parent) {
              final parentTitle = parent.privPolicyPointsHd ?? '';
              final parentId = parentTitle.toLowerCase().replaceAll(' ', '_');
              final isActive = state.selectedItem == parentTitle;

              return [
                InkWell(
                  key: itemKeys[normalize(parentTitle)],
                  onTap: () {
                    context
                        .read<PrivacyBloc>()
                        .add(UpdateSelectedItemEvent(parentTitle));

                    // Delay to ensure Bloc updates selectedItem before scroll
                    Future.delayed(const Duration(milliseconds: 50), () {
                      widget.onTapSection(widget.sectionKeys[parentId]!);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: isActive
                        ? Kstyles().bold(
                            text: parentTitle, size: 14, color: AppColors.black)
                        : Kstyles().reg(
                            text: parentTitle, size: 14, color: AppColors.blue),
                  ),
                ),
                Divider(
                    color: isActive ? AppColors.black : Colors.grey,
                    thickness: isActive ? 2 : 1),
                ...?parent.privPolicySubPoints?.map((sub) {
                  final subTitle = sub.privPolicySubHd ?? '';
                  final subId = subTitle.toLowerCase().replaceAll(' ', '_');
                  final isSubActive = state.selectedItem == subTitle;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        key: itemKeys[normalize(subTitle)],
                        onTap: () {
                          context
                              .read<PrivacyBloc>()
                              .add(UpdateSelectedItemEvent(subTitle));

                          Future.delayed(const Duration(milliseconds: 50), () {
                            widget.onTapSection(widget.sectionKeys[subId]!);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 4, bottom: 4),
                          child: isSubActive
                              ? Kstyles().bold(
                                  text: subTitle,
                                  size: 13,
                                  color: AppColors.black)
                              : Kstyles().reg(
                                  text: subTitle,
                                  size: 13,
                                  color: AppColors.blue),
                        ),
                      ),
                      Divider(
                          color: isSubActive ? AppColors.black : Colors.grey,
                          thickness: isSubActive ? 2 : 1),
                    ],
                  );
                }),
              ];
            }),
          ],
        );
      },
    );
  }
}
