// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vcyberiz/bloc/blogs_bloc/blogs_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';
import 'package:vcyberiz/screens/blog_page/widgets/blog_card.dart';

class FeaturedBlogs extends StatefulWidget {
  const FeaturedBlogs({super.key});

  @override
  State<FeaturedBlogs> createState() => _FeaturedBlogsState();
}

class _FeaturedBlogsState extends State<FeaturedBlogs> {
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
    return BlocBuilder<BlogsBloc, BlogsState>(
      builder: (context, state) {
        final blogs = state.blogsList ?? [];

        // Hide if no blogs or less than 1
        if (blogs.isEmpty) return SizedBox();

        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
            final isTablet =
                sizingInformation.deviceScreenType == DeviceScreenType.tablet;
            final visibleBlogs = blogs.take(3).toList();

            return Container(
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
                            text: StringConst.featuredBlogs,
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
                            context.goNamed(RouteConstants.blogsScreenPath);
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
                      height: 550,
                      width: Constants.desktopBreakPoint,
                      child: ListView.separated(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: blogs.length >= 3 ? 3 : blogs.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 20),
                        itemBuilder: (context, index) {
                          final blog = blogs[index];
                          return SizedBox(
                            width: (Constants.desktopBreakPoint / 3) - 15,
                            child: BlogCardContainer(
                              imageUrl: blog.secImg?.url ?? '',
                              heading: blog.title ?? "",
                              subheading: blog.description ?? "",
                              vcyberizText: blog.blogAuthor?.name ?? "",
                              documentId: blog.documentId ?? '',
                              blogDate: blog.publicationDate ?? DateTime.now(),
                              buttonText: blog.secCta?.label ?? "",
                            ),
                          );
                        },
                      ),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: blogs.length >= 3 ? 3 : blogs.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        final blog = blogs[index];
                        return BlogCardContainer(
                          imageUrl: blog.secImg?.url ?? '',
                          heading: blog.title ?? "",
                          subheading: blog.description ?? "",
                          vcyberizText: blog.blogAuthor?.name ?? "",
                          documentId: blog.documentId ?? '',
                          blogDate: blog.publicationDate ?? DateTime.now(),
                          buttonText: blogs[0].secCta?.label ?? "",
                        );
                      },
                    ),
                  if (sizingInformation.isMobile)
                    InkWell(
                      onTap: () {
                        context.goNamed(RouteConstants.blogsScreenPath);
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
          height: 550,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: blogs.length,
            separatorBuilder: (_, __) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              final blog = blogs[index];
              return SizedBox(
                width: 450,
                child: BlogCardContainer(
                  imageUrl: blog.secImg?.url ?? '',
                  heading: blog.title ?? "",
                  subheading: blog.description ?? "",
                  vcyberizText: blog.blogAuthor?.name ?? "",
                  documentId: blog.documentId ?? '',
                  blogDate: blog.publicationDate ?? DateTime.now(),
                  buttonText: blog.secCta?.label ?? "",
                ),
              );
            },
          ),
        ),
        Gap(20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: scrollToLeft,
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.arrow_back, size: 16),
                    ))),
            Gap(20),
            InkWell(
                onTap: scrollToRight,
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.arrow_forward, size: 16),
                    ))),
          ],
        ),
      ],
    );
  }
}
