import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/blogs_bloc/blogs_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';
import 'package:vcyberiz/screens/blog_page/widgets/blog_card.dart';

class RelatedBlogsWidget extends StatelessWidget {
  final String documentId;
  const RelatedBlogsWidget({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogsBloc, BlogsState>(
      builder: (context, state) {
        final allBlogs = state.blogsList ?? [];

        // Filter out the current blog using documentId
        final relatedBlogs =
            allBlogs.where((blog) => blog.documentId != documentId).toList();

        // If there are no related blogs, return an empty SizedBox
        if (relatedBlogs.isEmpty) return const SizedBox.shrink();

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
                      text: "Related Blogs",
                      size: 18,
                      color: AppColors.textBlueColor,
                    ),
                    InkWell(
                      onTap: () {
                        context.goNamed(RouteConstants.blogsScreenPath);
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
                  for (var blog in relatedBlogs) ...[
                    BlogCardContainer(
                      imageUrl: blog.secImg?.url ?? '',
                      heading: blog.title ?? "",
                      subheading: blog.description ?? "",
                      vcyberizText: blog.blogAuthor?.name ?? "",
                      documentId: blog.documentId ?? '',
                      blogDate: blog.publicationDate ?? DateTime.now(),
                      buttonText: blog.secCta?.label ?? "",
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
                          relatedBlogs.length >= 3 ? 3 : relatedBlogs.length,
                      itemBuilder: (context, index) {
                        final blog = relatedBlogs[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SizedBox(
                            width: getValueForScreenType(
                              context: context,
                              mobile: 300,
                              tablet: 450,
                              desktop: Constants.desktopBreakPoint / 3,
                            ),
                            child: BlogCardContainer(
                              imageUrl: blog.secImg?.url ?? '',
                              heading: blog.title ?? "",
                              subheading: blog.description ?? "",
                              vcyberizText: blog.blogAuthor?.name ?? "",
                              documentId: blog.documentId ?? '',
                              blogDate: blog.publicationDate ?? DateTime.now(),
                              buttonText: blog.secCta?.label ?? "",
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
