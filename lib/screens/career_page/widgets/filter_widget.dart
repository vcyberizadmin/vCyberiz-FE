// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/careers_bloc/careers_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_animated_button.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/data/model/careers_model/career_filter_Model.dart';

import '../../../core/utils/styles/app_colors.dart';

class FilterPopup extends StatefulWidget {
  const FilterPopup({super.key});

  @override
  State<FilterPopup> createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  final ValueNotifier<int?> _expandedIndex = ValueNotifier<int?>(null);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CareersBloc, CareersState>(
      builder: (context, state) {
        return SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _expandableFilter(
                state.filterData!.secBody![0],
                0,
                state.sortText,
              ),
              _expandableFilter(
                state.filterData!.secBody![1],
                1,
                state.filterText,
              ),
              _expandableFilter(
                  state.filterData!.secBody![2], 2, state.functionText),
              _expandableFilter(
                  state.filterData!.secBody![3], 3, state.locationText),
              Divider(
                height: 2,
                thickness: 2,
                color: AppColors.grey,
              ),
              Gap(10),
              InkWell(
                onTap: () {
                  context.read<CareersBloc>().add(
                        ClearFilterEvent(),
                      );
                },
                child: Container(
                  color: AppColors.transparent,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: kStyle.med(
                      text: state.filterData?.secButtons?.first.label ?? '',
                      size: 16,
                      color: AppColors.orangeTextColor,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAnimatedButton(
                    buttonWidth: 110,
                    isWhiteBg: true,
                    borderColor: AppColors.transparent,
                    text: state.filterData?.secButtons?.last.label ?? '',
                    bgButtonColor: AppColors.darkOrangeColor,
                    onTap: () {
                      context.read<CareersBloc>().add(
                            GetPaginationDataEvent(
                              currentIndex: 0,
                              itemCount: getValueForScreenType(
                                context: context,
                                mobile: 3,
                                desktop: 9,
                                tablet: 6,
                              ),
                              dataList: state.careerList,
                              search: state.searchText,
                              locationSearch: state.locationSearch,
                            ),
                          );
                      context.pop();
                    },
                  ),
                ],
              ),
              Gap(10),
            ],
          ),
        );
      },
    );
  }

  Widget _expandableFilter(SecBody data, int index, String text) {
    return ValueListenableBuilder<int?>(
      valueListenable: _expandedIndex,
      builder: (context, expandedIndex, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: kStyle.med(
                text: data.secHeader ?? '',
                size: 16,
                color: AppColors.orangeTextColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Theme(
              data: ThemeData().copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                tilePadding: EdgeInsets.symmetric(horizontal: 16.0),
                leading: ImageWidget(
                    imageUrl: data.secLogo?.first.url ?? '',
                    width: 24,
                    height: 24),
                title: kStyle.reg(
                  text: text,
                  size: 14,
                  color: AppColors.darkBlueText,
                  overflow: TextOverflow.ellipsis,
                ),
                expandedAlignment: Alignment.centerLeft,
                childrenPadding: EdgeInsets.only(left: 32, bottom: 5),
                maintainState: true,
                children: [
                  ...(data.secItems ?? []).map(
                    (SecItem item) => InkWell(
                      onTap: () {
                        context.read<CareersBloc>().add(
                              SelectFilterEvent(
                                text: item.secText ?? '',
                                header: data.secHeader ?? '',
                              ),
                            );
                      },
                      child: Container(
                        width: double.infinity,
                        color: AppColors.transparent,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: kStyle.reg(
                              text: item.secText ?? '',
                              size: 14,
                              color: text == item.secText
                                  ? AppColors.orangeTextColor
                                  : AppColors.darkBlueText,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (index == 0)
              Divider(height: 2, thickness: 2, color: AppColors.grey),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _expandedIndex.dispose();
    super.dispose();
  }
}
