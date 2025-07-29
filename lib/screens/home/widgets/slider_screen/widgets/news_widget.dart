import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/news_bloc/news_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/hover/hover.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        final news = state.newsList ?? [];

        // Hide if no blogs or less than 1
        if (news.isEmpty) return SizedBox();

        return SizedBox(
          width: getValueForScreenType(
            context: context,
            mobile: Constants.width * .92,
            tablet: Constants.width * .92,
            desktop: Constants.desktopBreakPoint,
          ),
          child: ResponsiveBuilder(builder: (context, sizingInformation) {
            final visibleBlogs = news.take(3).toList();
            if (sizingInformation.isDesktop) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 70,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(visibleBlogs.length, (infoIndex) {
                    final data = visibleBlogs[infoIndex];
                    return textWidget(
                      context,
                      "NEWS",
                      data.title ?? "",
                      data.documentId ?? "",
                      data.publicationDate ?? DateTime.now(),
                      infoIndex,
                    );
                  }),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: SizedBox(
                  width: Constants.width * .96,
                  child: Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(visibleBlogs.length, (infoIndex) {
                      final data = visibleBlogs[infoIndex];
                      return textWidget(
                        context,
                        "NEWS",
                        data.title ?? "",
                        data.documentId ?? "",
                        data.publicationDate ?? DateTime.now(),
                        infoIndex,
                      );
                    }),
                  ),
                ),
              );
            }
          }),
        );
      },
    );
  }

  Widget textWidget(
    BuildContext context,
    String heading,
    String discription,
    String documentId,
    DateTime date,
    int index,
  ) {
    return HoverView(builder: (isHover) {
      return InkWell(
        onTap: () {
          context.goNamed(
            RouteConstants.newsArticleRoute,
            pathParameters: {
              'name': heading,
            },
            queryParameters: {
              'id': documentId,
            },
          );
        },
        child: SizedBox(
          width: getValueForScreenType(
            context: context,
            mobile: Constants.width,
            tablet: Constants.width,
            desktop: (Constants.desktopBreakPoint / 3) - 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kStyle.reg(
                text: heading,
                size: 16,
                overflow: TextOverflow.visible,
                color: AppColors.orange,
              ),
              Gap(5),
              SizedBox(
                height: 100,
                child: kStyle.med(
                  text: discription,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 20,
                    tablet: 22,
                    desktop: 24,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  color: AppColors.white,
                ),
              ),
              Gap(10),
              kStyle.reg(
                text: DateFormat('dd MMM yyyy').format(date),
                size: getValueForScreenType(
                  context: context,
                  mobile: 16,
                  tablet: 18,
                  desktop: 18,
                ),
                overflow: TextOverflow.visible,
                color: AppColors.white,
              ),
              Gap(15),
              Container(
                height: 2,
                color: isHover
                    ? AppColors.orangeTextColor
                    : AppColors.backGroundColor,
              ),
            ],
          ),
        ),
      );
    });
  }
}
