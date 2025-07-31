// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';

class BlogCardContainer extends StatelessWidget {
  final String? imageUrl;
  final String? imageLabel;
  final String heading;
  final String documentId;
  final String subheading;
  final String vcyberizText;
  final DateTime blogDate;
  final String buttonText;
  final Function()? onTap;

  const BlogCardContainer({
    super.key,
    this.imageUrl,
    required this.heading,
    required this.subheading,
    required this.vcyberizText,
    required this.blogDate,
    required this.documentId,
    required this.buttonText,
    this.imageLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd MMMM yyyy').format(blogDate);
//!---------------------Blog Card
    return InkWell(
      onTap: onTap ??
          () {
            context.goNamed(
              RouteConstants.blogArticleRoute,
              pathParameters: {
                'name':
                    heading, // this is the slug, e.g. 'flutter-for-beginners'
              },
              queryParameters: {
                'id': documentId,
              },
            );
          },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
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
              context: context, mobile: 10, tablet: 15, desktop: 15)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThumbnailWithHoverEffect(
                imageUrl: imageUrl ?? '',
                imageLabel: imageLabel ?? '',
              ),
              ResponsiveBuilder(builder: (context, sizingInformation) {
                return Row(
                  mainAxisAlignment: sizingInformation.isMobile
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    kStyle.reg(
                      text: vcyberizText,
                      color: AppColors.blackGrey,
                      size: getValueForScreenType(
                          context: context,
                          mobile: 14,
                          desktop: 14,
                          tablet: 14),
                    ),
                    if (sizingInformation.isMobile)
                      Container(
                        width: 1,
                        height: 18,
                        color: AppColors.darkOrangeColor,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),

                    //!---------------Date
                    kStyle.reg(
                      text: formattedDate,
                      color: AppColors.blackGrey,
                      size: getValueForScreenType(
                          context: context,
                          mobile: 14,
                          desktop: 14,
                          tablet: 14),
                    ),
                  ],
                );
              }),
              Gap(5),
              //!------------------blog heading
              kStyle.bold(
                text: heading,
                color: AppColors.textBlueColor,
                overflow: TextOverflow.visible,
                height: 1,
                size: getValueForScreenType(
                    context: context, mobile: 20, desktop: 24, tablet: 24),
              ),

              //!--------------------blog SubHeading
              kStyle.reg(
                text: fCon.extractTwoSentences(subheading),
                color: AppColors.black,
                size: getValueForScreenType(
                    context: context, mobile: 14, desktop: 15, tablet: 15),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              //!----------------Text Button
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  kStyle.reg(
                    text: buttonText.isNotEmpty ? buttonText : "Read More",
                    color: AppColors.darkOrangeColor,
                    size: getValueForScreenType(
                        context: context, mobile: 14, tablet: 15, desktop: 16),
                  ),
                  const Gap(3),
                  const Icon(
                    Icons.arrow_forward,
                    color: AppColors.darkOrangeColor,
                    size: 16,
                  ),
                ],
              ),
              Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}

class ThumbnailWithHoverEffect extends StatelessWidget {
  final String imageUrl;
  final String imageLabel;
  ThumbnailWithHoverEffect(
      {super.key, required this.imageUrl, required this.imageLabel});

  final ValueNotifier<bool> isHovered = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => isHovered.value = true,
      onExit: (event) => isHovered.value = false,
      child: Container(
        height: getValueForScreenType(
            context: context, mobile: 200, desktop: 260, tablet: 230),
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ValueListenableBuilder(
            valueListenable: isHovered,
            builder: (context, value, child) {
              return AnimatedScale(
                scale: isHovered.value ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: ImageWidget(
                    imageUrl: imageUrl, label: imageLabel, fit: BoxFit.cover),
              );
            }),
      ),
    );
  }
}
