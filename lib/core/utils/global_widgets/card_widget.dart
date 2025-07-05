// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';

import '../styles/app_colors.dart';
import 'image_widget.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final int index;
  final int? hoveredIndex; // New parameter
  final Function(bool) onHover;
  final double? width;
  final bool isHome;

  const CardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.index,
    required this.hoveredIndex,
    required this.onHover,
    this.width,
    this.isHome = true,
  });
  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getValueForScreenType(
          context: context,
          mobile: 5,
          tablet: 5,
          desktop: 15,
        ),
        vertical: 5,
      ),
      child: MouseRegion(
        onEnter: (_) => widget.onHover(true),
        onExit: (_) => widget.onHover(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          height: getValueForScreenType(
            context: context,
            mobile: 270,
            tablet: 230,
            desktop: widget.isHome ? 350 : 330,
          ),
          width: widget.width ??
              getValueForScreenType(
                context: context,
                mobile: Constants.width,
                tablet: Constants.width * .45,
                desktop: 200,
              ),
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: widget.index == widget.hoveredIndex
                ? [
                    BoxShadow(
                      color: AppColors.greyBorder.withOpacity(.5),
                      blurRadius: 3,
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                    )
                  ]
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: getValueForScreenType(
              context: context,
              mobile: CrossAxisAlignment.center,
              tablet: widget.isHome
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              desktop: CrossAxisAlignment.center,
            ),
            children: [
              //!-----(Svg icon with Jump Effect)
              if (widget.imageUrl.isNotEmpty)
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: getValueForScreenType(
                      context: context,
                      mobile: Alignment.center,
                      tablet: widget.isHome
                          ? Alignment.centerLeft
                          : Alignment.center,
                      desktop: Alignment.center,
                    ),
                    child: ImageWidget(
                      imageUrl: widget.imageUrl,
                      fit: BoxFit.fill,
                      height: getValueForScreenType(
                        context: context,
                        mobile: 70,
                        tablet: 70,
                        desktop: 65,
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: kStyle.med(
                  text: widget.title,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 20,
                    tablet: 18,
                    desktop: 17,
                  ),
                  color: AppColors.darkOrangeColor,
                  overflow: TextOverflow.visible,
                  textAlign: getValueForScreenType(
                    context: context,
                    mobile: TextAlign.center,
                    tablet: widget.isHome ? TextAlign.left : TextAlign.center,
                    desktop: TextAlign.center,
                  ),
                  maxLines: 2,
                ),
              ),
              Gap(5),
              //!-----(Description)
              Expanded(
                flex: 2,
                child: kStyle.reg(
                  text: widget.description,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 14,
                    tablet: 14,
                    desktop: 14,
                  ),
                  color: AppColors.black,
                  overflow: TextOverflow.visible,
                  maxLines: widget.isHome ? null : 4,
                  textAlign: getValueForScreenType(
                    context: context,
                    mobile: TextAlign.center,
                    tablet: widget.isHome ? TextAlign.left : TextAlign.center,
                    desktop: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
