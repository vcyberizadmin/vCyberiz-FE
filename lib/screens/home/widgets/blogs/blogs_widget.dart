// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/blogs_bloc/blogs_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/hover/hover.dart';
import 'package:vcyberiz/data/model/blogs_model/blogs_list.dart';

import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/styles/app_colors.dart';
import '../../../../routes/route_constants.dart';

class BlogsWidget extends StatefulWidget {
  const BlogsWidget({super.key});

  @override
  State<BlogsWidget> createState() => _BlogsWidgetState();
}

class _BlogsWidgetState extends State<BlogsWidget> {
  final ExpandableCarouselController _expandableCarouselController =
      ExpandableCarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.powderBlue,
      width: Constants.width,
      child: Center(
        child: SizedBox(
          width: getValueForScreenType<double>(
            context: context,
            mobile: Constants.width * .92,
            tablet: Constants.width * .92,
            desktop: Constants.desktopBreakPoint,
          ),
          child: BlocBuilder<BlogsBloc, BlogsState>(
            builder: (context, state) {
              if (state.loading) {
                return SizedBox();
              }
              return Column(
                children: [
                  Gap(20),
                  ResponsiveBuilder(builder: (context, sizingInformation) {
                    if (sizingInformation.isDesktop) {
                      return Row(
                        children: [
                          //!-------------- heading Section

                          Expanded(flex: 2, child: headingWidget(state)),
                          Gap(100),
                          //!---------- Right Section (Cards)
                          Expanded(
                              flex: getValueForScreenType(
                                context: context,
                                mobile: 2,
                                tablet: 2,
                                desktop: 4,
                              ),
                              child: listWidget(state)),
                        ],
                      );
                    } else {
                      return Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          headingWidget(state),
                          //!---------- Right Section (Cards)
                          listWidget(state),
                          Gap(10),
                          buttonWidget(state),
                        ],
                      );
                    }
                  }),
                  Gap(20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget headingWidget(BlogsState state) {
    return SizedBox(
      height: getValueForScreenType(
        context: context,
        mobile: null,
        tablet: null,
        desktop: 500,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          kStyle.med(
            text: state.data?.sectionLabel ?? '',
            color: AppColors.darkBlueText,
            size: getValueForScreenType(
              context: context,
              mobile: 16,
              tablet: 16,
              desktop: 18,
            ),
          ),
          kStyle.med(
            text: state.data?.heading ?? '',
            color: AppColors.darkBlueText,
            size: getValueForScreenType(
              context: context,
              mobile: 25,
              tablet: 30,
              desktop: 35,
            ),
            overflow: TextOverflow.visible,
          ),
          SizedBox(height: 15),
          kStyle.med(
            text: state.data?.description ?? '',
            color: AppColors.darkBlueText,
            size: getValueForScreenType(
              context: context,
              mobile: 14,
              tablet: 16,
              desktop: 16,
            ),
            overflow: TextOverflow.visible,
          ),
          SizedBox(height: 30),
          getValueForScreenType(
            context: context,
            mobile: SizedBox(),
            tablet: SizedBox(),
            desktop: buttonWidget(state),
          ),
        ],
      ),
    );
  }

  Widget buttonWidget(
    BlogsState state,
  ) {
    return Row(
      children: [
        CustomButtonWidget(
          onTap: () {
            context.goNamed(RouteConstants.resourcePath);
          },
          bgButtonColor: AppColors.darkBlueText,
          buttonHoverColor: AppColors.darkBlueText,
          text: state.data?.buttonLink.label ?? '',
          textColor: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 8,
          ),
        )
      ],
    );
  }

  Widget listWidget(BlogsState state) {
    return MouseRegion(
      onHover: (event) {
        _expandableCarouselController.stopAutoPlay();
      },
      onExit: (event) {
        _expandableCarouselController.startAutoPlay();
      },
      child: ExpandableCarousel(
        options: ExpandableCarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 3000),
          autoPlayCurve: Curves.linear,
          controller: _expandableCarouselController,
          showIndicator: false,
          viewportFraction: getValueForScreenType(
            context: context,
            mobile: .7,
            tablet: .35,
            desktop: .35,
          ),
          enableInfiniteScroll: true,
          disableCenter: true,
        ),
        items: (state.blogsList ?? []).map(
          (BlogsListData data) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  context.goNamed(
                    RouteConstants.blogArticleRoute,
                    pathParameters: {
                      'name': data.title ??
                          '', // this is the slug, e.g. 'flutter-for-beginners'
                    },
                    queryParameters: {
                      'id': data.documentId ?? '',
                    },
                  );
                },
                child: BlogCard(
                  imageUrl: data.thumbnailImg?.url ?? '',
                  imageLabel: data.thumbnailImg?.name ?? '',
                  date: DateFormat('MMMM d, yyyy').format(
                    data.publicationDate ?? DateTime.now(),
                  ),
                  title: data.title ?? '',
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final String imageUrl;
  final String imageLabel;
  final String date;
  final String title;

  const BlogCard({
    super.key,
    required this.imageUrl,
    required this.date,
    required this.title,
    required this.imageLabel,
  });

  @override
  Widget build(BuildContext context) {
    return HoverView(builder: (isHover) {
      return AnimatedScale(
        scale: isHover ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Stack(
          children: [
            Container(
              width: getValueForScreenType(
                context: context,
                mobile: 270,
                tablet: 300,
                desktop: 330,
              ),
              height: getValueForScreenType(
                context: context,
                mobile: 300,
                tablet: 350,
                desktop: 400,
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.black.withOpacity(0.4), // Dark tint
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: decorationImageProviderWidget(imageUrl, imageLabel),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.transparent,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            Positioned(
              child: SizedBox(
                width: getValueForScreenType(
                  context: context,
                  mobile: 270,
                  tablet: 300,
                  desktop: 330,
                ),
                height: getValueForScreenType(
                  context: context,
                  mobile: 300,
                  tablet: 350,
                  desktop: 400,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      kStyle.reg(
                          text: date,
                          color: Colors.white,
                          size: getValueForScreenType(
                            context: context,
                            mobile: 14,
                            tablet: 14,
                            desktop: 14,
                          )),
                      Gap(5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: kStyle.med(
                              text: title,
                              color: isHover ? AppColors.orange : Colors.white,
                              size: getValueForScreenType(
                                context: context,
                                mobile: 14,
                                tablet: 16,
                                desktop: 18,
                              ),
                              maxLines: getValueForScreenType(
                                context: context,
                                mobile: 4,
                                tablet: 6,
                                desktop: 4,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gap(5),
                          SizedBox(
                              width: 15,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: isHover
                                    ? AppColors.orange
                                    : AppColors.white,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
