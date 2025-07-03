import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/events_bloc/events_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';
import 'package:vcyberiz/screens/event_page/widgets/events_card.dart';

class UpcomingEvents extends StatefulWidget {
  const UpcomingEvents({super.key});

  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  final ScrollController _scrollController = ScrollController();

  void scrollToLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 420,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollToRight() {
    _scrollController.animateTo(
      _scrollController.offset + 420,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsBloc, EventsState>(
      builder: (context, state) {
        final events = state.eventsList ?? [];

        // Hide if no blogs or less than 1
        if (events.isEmpty) return const SizedBox();

        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
            final isTablet =
                sizingInformation.deviceScreenType == DeviceScreenType.tablet;
            final visibleBlogs = events.take(3).toList();

            return SizedBox(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * .96,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: getValueForScreenType(
                            context: context,
                            mobile: Alignment.center,
                            tablet: Alignment.centerLeft,
                            desktop: Alignment.centerLeft,
                          ),
                          child: kStyle.med(
                            text: StringConst.upcomingEvents,
                            size: getValueForScreenType<double>(
                              context: context,
                              mobile: 20,
                              tablet: 25,
                              desktop: 30,
                            ),
                          ),
                        ),
                      ),
                      if (!sizingInformation.isMobile)
                        InkWell(
                          onTap: () {
                            context.goNamed(RouteConstants.eventsScreenPath);
                          },
                          child: kStyle.reg(
                            text: StringConst.viewAll,
                            size: getValueForScreenType<double>(
                              context: context,
                              mobile: 14,
                              tablet: 16,
                              desktop: 18,
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (isTablet)
                    _buildHorizontalScrollView(visibleBlogs)
                  else if (sizingInformation.isDesktop)
                    SizedBox(
                      height: 400,
                      width: Constants.desktopBreakPoint,
                      child: ListView.separated(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: events.length >= 3 ? 3 : events.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 20),
                        itemBuilder: (context, index) {
                          final event = events[index];
                          return SizedBox(
                            width: (Constants.desktopBreakPoint / 3) - 15,
                            child: EventsCard(
                              imageUrl: event.secImg?.url ?? '',
                              heading: event.eventTitle ?? "",
                              subheading: event.secDescription ?? "",
                              vcyberizText: event.blogAuthor?.name ?? "",
                              documentId: event.documentId ?? '',
                              blogDate: event.publicationDate ?? DateTime.now(),
                            ),
                          );
                        },
                      ),
                    )
                  else
                    for (int i = 0; i < 3; i++) ...[
                      EventsCard(
                        imageUrl: events[i].secImg?.url ?? '',
                        heading: events[i].eventTitle ?? "",
                        subheading: events[i].secDescription ?? "",
                        vcyberizText: events[i].blogAuthor?.name ?? "",
                        documentId: events[i].documentId ?? '',
                        blogDate: events[i].publicationDate ?? DateTime.now(),
                      ),
                      const Gap(20),
                    ],
                  if (sizingInformation.isMobile)
                    InkWell(
                      onTap: () {
                        context.goNamed(RouteConstants.eventsScreenPath);
                      },
                      child: kStyle.reg(
                        text: StringConst.viewAll,
                        size: getValueForScreenType<double>(
                          context: context,
                          mobile: 14,
                          tablet: 16,
                          desktop: 18,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHorizontalScrollView(
    List blogs,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: blogs.length,
            separatorBuilder: (_, __) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              final blog = blogs[index];
              return SizedBox(
                width: 350,
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
          ),
        ),
        const Gap(20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: scrollToLeft,
                child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.arrow_back, size: 16),
                    ))),
            const Gap(20),
            InkWell(
                onTap: scrollToRight,
                child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.arrow_forward, size: 16),
                    ))),
          ],
        ),
      ],
    );
  }
}
