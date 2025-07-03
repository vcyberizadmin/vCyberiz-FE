// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';

import 'news_card_list.dart';
import 'search_section.dart';

class NewsViewHome extends StatelessWidget {
  final double stickyPosition;
  final Key blogListKey;
  final TextEditingController searchController;
  final ScrollController scrollController;

  const NewsViewHome({
    super.key,
    required this.stickyPosition,
    required this.blogListKey,
    required this.searchController,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Constants.width,
      child: Center(
        child: SizedBox(
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width * 0.96,
            tablet: Constants.width * 0.92,
            desktop: Constants.desktopBreakPoint,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: NewsListSection(
                  key: blogListKey,
                  searchController: searchController,
                ),
              ),
              const Gap(100),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      height: stickyPosition,
                    ),
                    SearchSectionNews(
                      searchController: searchController,
                      scrollController: scrollController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
