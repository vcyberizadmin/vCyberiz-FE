import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../bloc/footer_bloc/footer_bloc.dart';
import '../../../../../core/utils/styles/app_colors.dart';
import '../../../../../core/utils/styles/text_styles.dart';
import '../../../../../data/model/footer_model/footer_model.dart';

class FirstColumnWidget extends StatelessWidget {
  final FooterState state;
  const FirstColumnWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Kstyles().bold(
          text: state.data?.siteMap?.platform?.referencesMap?.label ?? '',
          size: getValueForScreenType<double>(
            context: context,
            mobile: 12,
            tablet: 14,
            desktop: 16,
          ),
          color: AppColors.orangeTextColor,
        ),
        const SizedBox(height: 10),
        ...(state.data?.siteMap?.platform?.referencesMap?.references ?? []).map(
          (Cta data) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Kstyles().med(
              text: data.label ?? '',
              size: getValueForScreenType<double>(
                context: context,
                mobile: 10,
                tablet: 12,
                desktop: 14,
              ),
              color: AppColors.darkBlueText,
              overflow: TextOverflow.visible,
            ),
          ),
        ),
        const SizedBox(height: 10),
        //!-------------------(Contact Us Button)
        // CustomAnimatedButton(
        //   unselectedTextColor: AppColors.darkBlueText,
        //   textColor: AppColors.darkBlueText,
        //   selectedTextColor: AppColors.darkBlueText,
        //   bgButtonColor: AppColors.bluishGrey,
        //   borderColor: AppColors.darkBlueText,
        //   text: "${state.data?.siteMap?.platform?.cta?.label ?? ""} →",
        //   buttonWidth: 100,
        //   textSize: getValueForScreenType<double>(
        //     context: context,
        //     mobile: 10,
        //     tablet: 12,
        //     desktop: 14,
        //   ),
        // ),
      ],
    );
  }
}
