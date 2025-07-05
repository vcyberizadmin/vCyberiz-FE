// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/events_bloc/events_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/global_widgets/no_data_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';

import 'events_card.dart';

class EventListSection extends StatelessWidget {
  final TextEditingController searchController;
  const EventListSection({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsBloc, EventsState>(
      builder: (context, state) {
        context.read<EventsBloc>().add(
              GetPaginationDataEvent(
                itemCount: getValueForScreenType(
                  context: context,
                  mobile: 4,
                  tablet: 4,
                  desktop: 7,
                ),
                searchText: searchController.text,
                currentIndex: state.currentPageIndex,
                dataList: state.eventsList,
                selectedCategory: state.selectedCategory,
                selectedTags: const [],
              ),
            );
        final paginatedItems = state.paginatedList ?? [];
        if (paginatedItems.isEmpty) {
          return NoDataWidget(
            text: StringConst.noDataFound,
            color: AppColors.greyText,
          );
        }
        return ResponsiveBuilder(builder: (context, sizingInformation) {
          if (sizingInformation.isDesktop) {
            List<Widget> rows = [];
            final event = state.paginatedList ?? [];
            int i = 0;

// First full-width card (optional)
            if (event.isNotEmpty) {
              rows.add(
                Row(
                  children: [
                    Expanded(
                        child: firstCard(
                      context: context,
                      imageUrl: event[0].secImg?.url ?? '',
                      heading: event[0].eventTitle ?? "",
                      documentId: event[0].documentId ?? '',
                      date: event[0].publicationDate ?? DateTime.now(),
                    )),
                  ],
                ),
              );
              i = 1; // Start loop from second item
            }

// Add rows of 3 cards
            while (i < event.length) {
              List<Widget> cards = [];

              for (int j = 0; j < 3; j++) {
                if (i < event.length) {
                  cards.add(
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: EventsCard(
                          imageUrl: event[i].secImg?.url ?? '',
                          heading: event[i].eventTitle ?? "",
                          subheading: event[i].secDescription ?? "",
                          vcyberizText: event[i].blogAuthor?.name ?? "",
                          documentId: event[i].documentId ?? '',
                          blogDate: event[i].publicationDate ?? DateTime.now(),
                        ),
                      ),
                    ),
                  );
                  i++;
                } else {
                  // Fill the remaining space if less than 3
                  cards.add(Expanded(child: SizedBox()));
                }
              }

              rows.add(Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: cards,
              ));
            }

// Wrap all rows in a column
            return Column(
              spacing: 10,
              children: rows,
            );
          } else if (sizingInformation.isTablet) {
            List<Widget> rows = [];
            final event = state.paginatedList ?? [];
            int i = 0;

            // First full-width card (optional)
            if (event.isNotEmpty) {
              rows.add(
                Row(
                  children: [
                    Expanded(
                      child: firstCard(
                        context: context,
                        imageUrl: event[0].secImg?.url ?? '',
                        heading: event[0].eventTitle ?? "",
                        documentId: event[0].documentId ?? '',
                        date: event[0].publicationDate ?? DateTime.now(),
                      ),
                    ),
                  ],
                ),
              );
              i = 1; // Start loop from second item
            }

            // Add rows of 2 cards
            while (i < event.length) {
              List<Widget> cards = [];

              for (int j = 0; j < 2; j++) {
                if (i < event.length) {
                  cards.add(
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: EventsCard(
                          imageUrl: event[i].secImg?.url ?? '',
                          heading: event[i].eventTitle ?? "",
                          subheading: event[i].secDescription ?? "",
                          vcyberizText: event[i].blogAuthor?.name ?? "",
                          documentId: event[i].documentId ?? '',
                          blogDate: event[i].publicationDate ?? DateTime.now(),
                        ),
                      ),
                    ),
                  );
                  i++;
                } else {
                  cards.add(const Expanded(child: SizedBox()));
                }
              }

              rows.add(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: cards,
                ),
              );
            }

            return Column(
              spacing: 10,
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
                  child: EventsCard(
                    imageUrl: blog.secImg?.url ?? '',
                    heading: blog.eventTitle ?? "",
                    subheading: blog.secDescription ?? "",
                    vcyberizText: blog.blogAuthor?.name ?? "",
                    documentId: blog.documentId ?? '',
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

  Widget firstCard({
    required BuildContext context,
    required String documentId,
    required String imageUrl,
    required String heading,
    required DateTime date,
  }) {
    final String formattedDate = DateFormat('EEEE-dd MMMM yyyy').format(date);

    return InkWell(
      onTap: () {
        context.goNamed(
          RouteConstants.eventDetailsPath,
          queryParameters: {
            'id': documentId,
          },
        );
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 900,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(getValueForScreenType(
            context: context,
            mobile: 10,
            tablet: 15,
            desktop: 15,
          )),
          child: Row(
            spacing: 10,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(10),

                    //!------------------blog heading
                    kStyle.bold(
                      text: heading,
                      color: AppColors.textBlueColor,
                      size: getValueForScreenType(
                          context: context,
                          mobile: 14,
                          desktop: 20,
                          tablet: 18),
                      maxLines: 2,
                    ),
                    Gap(10),

                    kStyle.reg(
                      text: formattedDate,
                      color: AppColors.blackGrey,
                      size: getValueForScreenType(
                          context: context,
                          mobile: 14,
                          desktop: 14,
                          tablet: 14),
                    ),
                    Gap(10),
                    //!----------------Text Button
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        kStyle.med(
                          text: "Register Now",
                          color: AppColors.darkOrangeColor,
                          size: getValueForScreenType(
                              context: context,
                              mobile: 14,
                              tablet: 15,
                              desktop: 16),
                        ),
                        const Gap(3),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.darkOrangeColor,
                          size: 16,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ThumbnailWithHoverEffect(
                  imageUrl: imageUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
