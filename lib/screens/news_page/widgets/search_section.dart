// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/news_bloc/news_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';
import 'package:vcyberiz/data/model/blogs_model/blog_tags_model.dart';

class SearchSectionNews extends StatelessWidget {
  final TextEditingController searchController;
  final ScrollController scrollController;
  const SearchSectionNews({
    super.key,
    required this.searchController,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SizedBox(
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width * 0.92,
            tablet: Constants.width * 0.96,
            desktop: Constants.desktopBreakPoint,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (sizingInformation.isDesktop)
                SearchWidget(
                  searchController: searchController,
                  scrollController: scrollController,
                ),
              Gap(20),
              CategoriesWidget(
                scrollController: scrollController,
              ),
              Gap(20),
              TagsWidget(
                scrollController: scrollController,
              ),
              Gap(10),
            ],
          ),
        );
      },
    );
  }
}

//!--------------------------Search Container
class SearchWidget extends StatefulWidget {
  final TextEditingController searchController;
  final ScrollController scrollController;
  SearchWidget({
    super.key,
    required this.searchController,
    required this.scrollController,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return ResponsiveBuilder(builder: (context, sizingInformation) {
          return Container(
            height: sizingInformation.isMobile ? 50 : 70,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius:
                  BorderRadius.circular(sizingInformation.isMobile ? 8 : 16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.searchController,
                    style: TextStyle(
                      fontSize: sizingInformation.isMobile ? 14 : 16,
                      fontFamily: Constants.font,
                      color: AppColors.fontBlack,
                    ),
                    cursorColor: AppColors.fontBlack,
                    cursorWidth: 1.5,
                    decoration: InputDecoration(
                      hintText: "Search Here",
                      hintStyle: TextStyle(
                        fontSize: sizingInformation.isMobile ? 14 : 16,
                        fontFamily: Constants.font,
                        color: AppColors.greyText,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    onChanged: (_) {
                      setState(() {});

                      context.read<NewsBloc>().add(
                            GetPaginationDataEvent(
                              itemCount: getValueForScreenType(
                                context: context,
                                mobile: 4,
                                tablet: 4,
                                desktop: 5,
                              ),
                              searchText: widget.searchController.text,
                              currentIndex: 0,
                              dataList: state.newsList,
                              selectedCategory: '',
                              selectedTags: const [],
                            ),
                          );
                      widget.scrollController.jumpTo(420);
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    widget.searchController.clear();
                    setState(() {});

                    context.read<NewsBloc>().add(
                          GetPaginationDataEvent(
                            itemCount: getValueForScreenType(
                              context: context,
                              mobile: 4,
                              tablet: 4,
                              desktop: 5,
                            ),
                            searchText: widget.searchController.text,
                            currentIndex: 0,
                            dataList: state.newsList,
                            selectedCategory: '',
                            selectedTags: const [],
                          ),
                        );
                    widget.scrollController.jumpTo(420);
                  },
                  child: Container(
                    height: sizingInformation.isMobile ? 50 : 70,
                    width: sizingInformation.isMobile ? 48 : 56,
                    decoration: BoxDecoration(
                      color: AppColors.orangeTextColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                            sizingInformation.isMobile ? 8 : 16),
                        bottomRight: Radius.circular(
                            sizingInformation.isMobile ? 8 : 16),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: sizingInformation.isMobile ? 12 : 16),
                    child: SvgPicture.asset(
                      AssetConst.search,
                      colorFilter: ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}

//!---------------------Categories section
class CategoriesWidget extends StatelessWidget {
  final ScrollController scrollController;
  const CategoriesWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Kstyles().bold(
                  text: state.categoriesList?.secHeader ?? '',
                  size: 18,
                  color: AppColors.fontBlack),
              const Gap(18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: AppColors.primaryOrangeColor,
                      height: 1,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: AppColors.greyBorder,
                      height: 0.5,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const Gap(24),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: state.categoriesList?.blogCategories?.length ?? 0,
                itemBuilder: (context, index) {
                  final data = state.categoriesList?.blogCategories?[index];
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.arrow_forward,
                      color: (data?.name ?? '') == state.selectedCategory
                          ? AppColors.darkOrangeColor
                          : AppColors.darkBlueText,
                    ),
                    title: Kstyles().reg(
                      size: 16,
                      text: data?.name ?? '',
                      color: (data?.name ?? '') == state.selectedCategory
                          ? AppColors.darkOrangeColor
                          : AppColors.darkBlueText,
                    ),
                    onTap: () {
                      if (data?.name == state.selectedCategory) {
                        context.read<NewsBloc>().add(
                              GetPaginationDataEvent(
                                itemCount: getValueForScreenType(
                                  context: context,
                                  mobile: 4,
                                  tablet: 4,
                                  desktop: 5,
                                ),
                                searchText: '',
                                currentIndex: 0,
                                dataList: state.newsList,
                                selectedCategory: '',
                                selectedTags: state.selectedTags,
                              ),
                            );
                      } else {
                        context.read<NewsBloc>().add(
                              GetPaginationDataEvent(
                                itemCount: getValueForScreenType(
                                  context: context,
                                  mobile: 4,
                                  tablet: 4,
                                  desktop: 5,
                                ),
                                searchText: '',
                                currentIndex: 0,
                                dataList: state.newsList,
                                selectedCategory: data?.name ?? '',
                                selectedTags: state.selectedTags,
                              ),
                            );
                      }
                      scrollController.jumpTo(420);
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

//!-------------------------------tags Section
class TagsWidget extends StatefulWidget {
  final ScrollController scrollController;

  const TagsWidget({
    super.key,
    required this.scrollController,
  });

  @override
  State<TagsWidget> createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  BlogTag? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return Container(
          width: Constants.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: getValueForScreenType(
                  context: context, mobile: 16, tablet: 24, desktop: 32),
              vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kStyle.bold(
                  text: state.tagsList?.secHeader ?? '',
                  size: 18,
                  color: AppColors.fontBlack),
              const Gap(18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: AppColors.primaryOrangeColor,
                      height: 1,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: AppColors.greyBorder,
                      height: 0.5,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              const Gap(24),
              Wrap(
                children: [
                  ...(state.tagsList?.blogTags ?? []).map(
                    (BlogTag data) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            hoveredIndex = data;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            hoveredIndex = null;
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            context.read<NewsBloc>().add(GetTagsEvent(
                                  selectedTags: data,
                                  itemCount: getValueForScreenType(
                                    context: context,
                                    mobile: 4,
                                    tablet: 4,
                                    desktop: 5,
                                  ),
                                ));
                            widget.scrollController.jumpTo(420);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: data == hoveredIndex
                                  ? AppColors.primaryOrangeColor
                                  : (state.selectedTags).contains(data)
                                      ? AppColors.darkOrangeColor
                                      : AppColors.backGroundColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Kstyles().reg(
                              size: 14,
                              text: data.name ?? '',
                              color: data == hoveredIndex
                                  ? AppColors.white
                                  : (state.selectedTags).contains(data)
                                      ? AppColors.white
                                      : AppColors.darkBlueText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
