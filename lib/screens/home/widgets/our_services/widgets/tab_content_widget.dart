import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/global_widgets/custom_button_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/routes/route_constants.dart';

import '../../../../../data/model/our_service_model/our_service_model.dart';

class TabContentWidget extends StatelessWidget {
  final String imageUrl;
  final String heading;
  final String description;
  final String buttonText;
  final List<Stat> statList;
  final Color color;
  final List<Color>? gradientColor;
  const TabContentWidget({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.buttonText,
    required this.statList,
    required this.heading,
    required this.color,
    this.gradientColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //!--------------(Description)
        kStyle.bold(
          text: heading,
          color: AppColors.black,
          size: getValueForScreenType(
            context: context,
            mobile: 20,
            tablet: 20,
            desktop: 30,
          ),
          overflow: TextOverflow.visible,
        ),
        const Gap(20),
        kStyle.med(
          text: description,
          color: AppColors.black,
          size: getValueForScreenType(
            context: context,
            mobile: 14,
            tablet: 15,
            desktop: 16,
          ),
          overflow: TextOverflow.visible,
        ),
        const Gap(20),
        //!-------------(explore global services button)

        Row(
          children: [
            CustomButtonWidget(
              bgButtonColor: color,
              buttonHoverColor: color,
              text: buttonText,
              showIcon: true,
              textSize: 16,
              onTap: () {
                context.goNamed(RouteConstants.servicesPath);
              },
            ),
          ],
        ),
        const Gap(30),
      ],
    );
  }

  // String getCombinedText(List<Description> description) {
  //   return description
  //       .map((item) => item.children?.map((child) => child.text).join(''))
  //       .join(' ')
  //       .replaceAll("<div>", "")
  //       .replaceAll("</div>", "")
  //       .replaceAll("<p", "<span")
  //       .replaceAll("</p>", "</span>");
  // }
}
