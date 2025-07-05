import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/news_bloc/news_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';
import 'package:vcyberiz/screens/blog_page/widgets/blog_card.dart';

class RelatedNewsWidget extends StatelessWidget {
  final String documentId;
  const RelatedNewsWidget({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        final allNews = state.paginatedList ?? [];

        // Filter out the current news using documentId
        final relatedNews =
            allNews.where((news) => news.documentId != documentId).toList();

        // If there are no related news, return an empty SizedBox
        if (relatedNews.isEmpty) return const SizedBox.shrink();

        // Otherwise, show the widget
        return ResponsiveBuilder(builder: (context, sizingInformation) {
          return SizedBox(
            width: getValueForScreenType<double>(
              context: context,
              mobile: Constants.width * 0.96,
              tablet: Constants.width * 0.92,
              desktop: Constants.desktopBreakPoint,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    kStyle.bold(
                      text: "Related News",
                      size: 18,
                      color: AppColors.textBlueColor,
                    ),
                    InkWell(
                      onTap: () {
                        context.goNamed(RouteConstants.newsPath);
                      },
                      child: kStyle.reg(
                        text: StringConst.viewAll,
                        size: 14,
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                if (sizingInformation.isMobile)
                  for (var news in relatedNews) ...[
                    BlogCardContainer(
                      imageUrl: news.secImg?.url ?? '',
                      heading: news.title ?? "",
                      subheading: news.description ?? "",
                      vcyberizText: news.blogAuthor?.name ?? "",
                      documentId: news.documentId ?? '',
                      blogDate: news.publicationDate ?? DateTime.now(),
                      buttonText: news.secCta?.label ?? "",
                    ),
                    const Gap(24)
                  ]
                else ...[
                  SizedBox(
                    height: getValueForScreenType(
                      context: context,
                      mobile: null,
                      tablet: 704,
                      desktop: 600,
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          relatedNews.length >= 3 ? 3 : relatedNews.length,
                      itemBuilder: (context, index) {
                        final news = relatedNews[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SizedBox(
                            width: getValueForScreenType(
                              context: context,
                              mobile: 300,
                              tablet: 450,
                              desktop: 450,
                            ),
                            child: BlogCardContainer(
                              imageUrl: news.secImg?.url ?? '',
                              heading: news.title ?? "",
                              subheading: news.description ?? "",
                              vcyberizText: news.blogAuthor?.name ?? "",
                              documentId: news.documentId ?? '',
                              blogDate: news.publicationDate ?? DateTime.now(),
                              buttonText: news.secCta?.label ?? "",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Gap(30),
                ]
              ],
            ),
          );
        });
      },
    );
  }
}
