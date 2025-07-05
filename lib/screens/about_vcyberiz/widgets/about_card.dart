// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';

import '../../../../../core/utils/styles/app_colors.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final int index;
  const CardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.index,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  int? _hoveredIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _hoveredIndex = widget.index; // Mark this item as hovered
          });
        },
        onExit: (_) {
          setState(() {
            _hoveredIndex = null; // Remove hover when pointer exits
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: _hoveredIndex == widget.index ? 320 : 300,
          width: getValueForScreenType(
            context: context,
            mobile: 100,
            desktop: _hoveredIndex == widget.index ? 170 : 150,
            tablet: 120,
          ),
          padding: EdgeInsets.all(
            getValueForScreenType(
              context: context,
              mobile: 5,
              tablet: 10,
              desktop: _hoveredIndex == widget.index ? 25 : 15,
            ),
          ),
          decoration: BoxDecoration(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: _hoveredIndex == widget.index
                ? Border.all(
                    color: AppColors.darkOrangeColor,
                    width: 2,
                  )
                : Border(
                    left: BorderSide(
                      color: AppColors.darkOrangeColor,
                      width: 1,
                    ),
                    right: BorderSide(
                      color: AppColors.darkOrangeColor,
                      width: 2,
                    ),
                    top: BorderSide(
                      color: AppColors.darkOrangeColor,
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: AppColors.darkOrangeColor,
                      width: 2,
                    ),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //!-----(Svg icon)
              widget.imageUrl.isNotEmpty
                  ? Center(child: SvgPicture.asset("assets/svg/dollarCoin.svg"))
                  : const SizedBox.shrink(),

              //!-----(Title)
              Gap(10),
              Expanded(
                flex: 1,
                child: Kstyles().med(
                  text: widget.title,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 8,
                    desktop: 12,
                    tablet: 9,
                  ),
                  textAlign: TextAlign.center,
                  color: AppColors.darkOrangeColor,
                  overflow: TextOverflow.visible,
                ),
              ),

              Gap(10),
              //!-----(Description)

              Expanded(
                flex: 2,
                child: Kstyles().reg(
                  text: widget.description,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 7,
                    desktop: 10,
                    tablet: 9,
                  ),
                  textAlign: TextAlign.center,
                  color: AppColors.darkBlueText,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
