// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

import '../../../bloc/about_us_bloc/about_us_bloc.dart';
import '../../../data/model/about_us_model/about_us_our_values_model.dart';

class ValuesSection extends StatefulWidget {
  const ValuesSection({super.key});

  @override
  State<ValuesSection> createState() => _ValuesSectionState();
}

class _ValuesSectionState extends State<ValuesSection> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsBloc, AboutUsState>(
      builder: (context, state) {
        if (state.loading) {
          return const SizedBox();
        }
        return Container(
          width: Constants.width,
          color: AppColors.backGroundColor,
          child: Center(
            child: SizedBox(
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width * .96,
                tablet: Constants.width * .92,
                desktop: Constants.desktopBreakPoint,
              ),
              child: Column(
                children: [
                  Gap(
                    getValueForScreenType(
                        context: context, mobile: 10, tablet: 15, desktop: 20),
                  ),
                  kStyle.semiBold(
                    text: state.ourValuesData?.secHeader ?? '',
                    color: AppColors.textBlueColor,
                    size: getValueForScreenType<double>(
                      context: context,
                      mobile: 25,
                      tablet: 30,
                      desktop: 35,
                    ),
                  ),
                  Gap(getValueForScreenType(
                    context: context,
                    mobile: 20,
                    desktop: 25,
                    tablet: 20,
                  )),
                  SizedBox(
                    // width: Constants.width * .58,
                    width: getValueForScreenType(
                        context: context,
                        mobile: Constants.width,
                        tablet: Constants.width,
                        desktop: Constants.desktopBreakPoint * .9),

                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getValueForScreenType(
                          context: context,
                          mobile: 1,
                          tablet: 2,
                          desktop: 3,
                        ),
                        crossAxisSpacing: getValueForScreenType(
                            context: context,
                            mobile: 10,
                            tablet: 10,
                            desktop: 30),
                        mainAxisSpacing: getValueForScreenType(
                            context: context,
                            mobile: 10,
                            tablet: 10,
                            desktop: 30),
                        childAspectRatio: getValueForScreenType(
                          context: context,
                          mobile: 2 / 1.6,
                          tablet: 2 / 1.5,
                          desktop: 2 / 1.5,
                        ),
                      ),
                      shrinkWrap: true,
                      itemCount: (state.ourValuesData?.secCard ?? []).length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        SecCard? data = state.ourValuesData?.secCard?[index];
                        return CardWidget(
                          title: data?.secHeader ?? '',
                          description: data?.description ?? '',
                          imageUrl: data?.logoImg?.url ?? '',
                          imageLabel: data?.logoImg?.name ?? '',
                          index: index,
                          hoveredIndex: _hoveredIndex,
                          onHover: (isHovered) {
                            setState(() {
                              _hoveredIndex = isHovered ? index : null;
                            });
                          },
                          isHome: false,
                        );
                      },
                    ),
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CardWidget extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String imageLabel;
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
    required this.imageLabel,
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
          desktop: 5,
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
            desktop: 330,
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
              tablet: CrossAxisAlignment.center,
              desktop: CrossAxisAlignment.center,
            ),
            children: [
              //!-----(Svg icon with Jump Effect)
              if (widget.imageUrl.isNotEmpty)
                Expanded(
                  child: Align(
                    alignment: getValueForScreenType(
                      context: context,
                      mobile: Alignment.center,
                      tablet: Alignment.center,
                      desktop: Alignment.center,
                    ),
                    child: ImageWidget(
                      imageUrl: widget.imageUrl,
                      label: widget.imageLabel,
                      fit: BoxFit.fill,
                      height: getValueForScreenType(
                        context: context,
                        mobile: 70,
                        tablet: 70,
                        desktop: 85,
                      ),
                    ),
                  ),
                ),
              Gap(10),
              Expanded(
                child: kStyle.med(
                  text: widget.title,
                  size: getValueForScreenType(
                    context: context,
                    mobile: 20,
                    tablet: 18,
                    desktop: 25,
                  ),
                  color: AppColors.darkOrangeColor,
                  overflow: TextOverflow.visible,
                  textAlign: getValueForScreenType(
                    context: context,
                    mobile: TextAlign.center,
                    tablet: TextAlign.center,
                    desktop: TextAlign.center,
                  ),
                  maxLines: 2,
                ),
              ),
              Gap(15),
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
                  maxLines: 4,
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
