// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/hover/hover.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';
import 'package:vcyberiz/routes/route_constants.dart';

class EventsCard extends StatelessWidget {
  final String? imageUrl;
  final String heading;
  final String documentId;
  final String subheading;
  final String vcyberizText;
  final DateTime blogDate;
  const EventsCard({
    super.key,
    this.imageUrl,
    required this.heading,
    required this.subheading,
    required this.vcyberizText,
    required this.blogDate,
    required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        DateFormat('EEEE-dd MMMM yyyy').format(blogDate);
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
              color: Colors.grey.withOpacity(0.1),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThumbnailWithHoverEffect(
                imageUrl: imageUrl,
              ),
              const Gap(10),

              //!------------------blog heading
              Kstyles().bold(
                text: heading,
                color: AppColors.textBlueColor,
                size: getValueForScreenType(
                    context: context, mobile: 14, desktop: 20, tablet: 18),
                maxLines: 2,
              ),
              Gap(10),

              Kstyles().reg(
                text: formattedDate,
                color: AppColors.blackGrey,
                size: getValueForScreenType(
                    context: context, mobile: 14, desktop: 14, tablet: 14),
              ),
              Gap(10),
              //!----------------Text Button
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Kstyles().med(
                    text: "View Details",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ThumbnailWithHoverEffect extends StatelessWidget {
  ThumbnailWithHoverEffect({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  final ValueNotifier<bool> isHovered = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return HoverView(builder: (isHover) {
      return Container(
        height: getValueForScreenType(
            context: context, mobile: 150, desktop: 230, tablet: 230),
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: AnimatedScale(
          scale: isHover ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: ImageWidget(imageUrl: imageUrl!, fit: BoxFit.cover),
        ),
      );
    });
  }
}
