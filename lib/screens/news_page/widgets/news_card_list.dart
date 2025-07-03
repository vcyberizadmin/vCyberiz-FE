import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/news_bloc/news_bloc.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/global_widgets/no_data_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/screens/news_page/widgets/news_card.dart';

class NewsListSection extends StatelessWidget {
  final TextEditingController searchController;
  const NewsListSection({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        context.read<NewsBloc>().add(
              GetPaginationDataEvent(
                itemCount: getValueForScreenType(
                  context: context,
                  mobile: 4,
                  tablet: 4,
                  desktop: 5,
                ),
                searchText: searchController.text,
                currentIndex: state.currentPageIndex,
                dataList: state.newsList,
                selectedCategory: state.selectedCategory,
                selectedTags: const [],
              ),
            );
        final paginatedItems = state.paginatedList ?? [];
        if (paginatedItems.isEmpty) {
          return const NoDataWidget(
            text: StringConst.noDataFound,
            color: AppColors.greyText,
          );
        }
        return ResponsiveBuilder(builder: (context, sizingInformation) {
          if (sizingInformation.isDesktop) {
            List<Widget> rows = [];
            final blogs = state.paginatedList ?? [];
            int i = 0;

// First blog - featured full width
            if (blogs.isNotEmpty) {
              rows.add(
                Row(
                  children: [
                    Expanded(
                      child: NewsCardContainer(
                        imageUrl: blogs[0].secImg?.url ?? '',
                        heading: blogs[0].title ?? "",
                        subheading: blogs[0].description ?? "",
                        vcyberizText: blogs[0].blogAuthor?.name ?? "",
                        documentId: blogs[0].documentId ?? '',
                        blogDate: blogs[0].publicationDate ?? DateTime.now(),
                        buttonText: blogs[0].secCta?.label ?? "",
                      ),
                    ),
                  ],
                ),
              );
              i = 1; // Start from 2nd item
            }

// Loop through remaining blogs in pairs
            while (i < blogs.length) {
              if (i + 1 < blogs.length) {
                // Normal 2-column row
                rows.add(
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: NewsCardContainer(
                            imageUrl: blogs[i].secImg?.url ?? '',
                            heading: blogs[i].title ?? "",
                            subheading: blogs[i].description ?? "",
                            vcyberizText: blogs[i].blogAuthor?.name ?? "",
                            documentId: blogs[i].documentId ?? '',
                            buttonText: blogs[i].secCta?.label ?? "",
                            blogDate:
                                blogs[i].publicationDate ?? DateTime.now(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: NewsCardContainer(
                            imageUrl: blogs[i + 1].secImg?.url ?? '',
                            heading: blogs[i + 1].title ?? "",
                            subheading: blogs[i + 1].description ?? "",
                            vcyberizText: blogs[i + 1].blogAuthor?.name ?? "",
                            documentId: blogs[i + 1].documentId ?? '',
                            buttonText: blogs[i + 1].secCta?.label ?? "",
                            blogDate:
                                blogs[i + 1].publicationDate ?? DateTime.now(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                i += 2;
              } else {
                // Only one item left – aligned left
                rows.add(
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: NewsCardContainer(
                            imageUrl: blogs[i].secImg?.url ?? '',
                            heading: blogs[i].title ?? "",
                            subheading: blogs[i].description ?? "",
                            vcyberizText: blogs[i].blogAuthor?.name ?? "",
                            documentId: blogs[i].documentId ?? '',
                            buttonText: blogs[i].secCta?.label ?? "",
                            blogDate:
                                blogs[i].publicationDate ?? DateTime.now(),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox())
                    ],
                  ),
                );
                i++;
              }
            }

// Wrap all rows in a column
            return Column(
              spacing: 20,
              children: rows,
            );
          } else {
            return ListView.builder(
              itemCount: paginatedItems.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final blog = paginatedItems[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getValueForScreenType(
                    context: context,
                    mobile: 10,
                    tablet: 10,
                    desktop: 20,
                  )),
                  child: NewsCardContainer(
                    imageUrl: blog.secImg?.url ?? '',
                    heading: blog.title ?? "",
                    subheading: blog.description ?? "",
                    vcyberizText: blog.blogAuthor?.name ?? "",
                    documentId: blog.documentId ?? '',
                    buttonText: blog.secCta?.label ?? "",
                    blogDate: blog.publicationDate ?? DateTime.now(),
                  ),
                );
              },
            );
          }
        });
      },
    );
  }
}
