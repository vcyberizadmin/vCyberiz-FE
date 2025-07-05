// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/login/login_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/asset_constants.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/constants/string_const.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class ReCaptchaIntegration extends StatelessWidget {
  const ReCaptchaIntegration({
    super.key,
    required this.onChanged,
    required this.isChecked,
  });
  final void Function(bool?)? onChanged;
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey),
              ),
              child: _contentInsideCheckBox(context),
            ),
          ],
        );
      },
    );
  }

  Padding _contentInsideCheckBox(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 7,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _checkBoxWithTitle(context),
          const Gap(100),
          _captchaImageWithPrivacy(context),
          const Gap(8),
        ],
      ),
    );
  }

  Column _captchaImageWithPrivacy(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          "${dotenv.env[Constants.baseURL] ?? ""}/data/uploads/Contact%20Us/reCaptcha.webp",
          height: 60,
        ),
        _privacyAndTermsLink(context),
      ],
    );
  }

  RichText _privacyAndTermsLink(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 12.0,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: StringConst.privacy,
            style: kStyle
                .semiBold(
                  color: Colors.grey.shade600,
                  text: '',
                  size: getValueForScreenType(
                    context: context,
                    mobile: 13,
                    tablet: 13,
                    desktop: 13,
                  ),
                )
                .style,
            recognizer: TapGestureRecognizer()
              ..onTap = () async => (StringConst.privacyLink),
          ),
          const TextSpan(text: '-'),
          TextSpan(
            text: StringConst.terms,
            style: kStyle
                .semiBold(
                  color: Colors.grey.shade600,
                  text: '',
                  size: getValueForScreenType(
                    context: context,
                    mobile: 13,
                    tablet: 13,
                    desktop: 13,
                  ),
                )
                .style,
            recognizer: TapGestureRecognizer()
              ..onTap = () async => (StringConst.termsLink),
          ),
        ],
      ),
    );
  }

  BlocBuilder _checkBoxWithTitle(
    context,
  ) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Row(
          children: [
            const Gap(10),
            state.loadingToken
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: AppColors.selectedBlueColor,
                    ),
                  )
                : Container(
                    height: 20,
                    width: 20,
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.grey),
                    //   shape: BoxShape.rectangle,
                    //   borderRadius: BorderRadius.circular(5),
                    // ),
                    child: Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.green.shade700,
                      hoverColor: Colors.grey.shade300,
                      value: isChecked,
                      onChanged: onChanged,
                    ),
                  ),
            const Gap(10),
            kStyle.semiBold(
              text: StringConst.iAmNotARobot,
              size: 14,
              color: Colors.black87.withAlpha(200),
            ),
          ],
        );
      },
    );
  }
}
