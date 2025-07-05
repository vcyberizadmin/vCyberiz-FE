import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vcyberiz/core/utils/global_widgets/know_more_widget.dart';
import 'package:vcyberiz/routes/route_constants.dart';

import '../../../bloc/about_us_bloc/about_us_bloc.dart';

class AboutUsSecurityMaturitySection extends StatelessWidget {
  const AboutUsSecurityMaturitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsBloc, AboutUsState>(
      builder: (context, state) {
        if (state.loading) {
          return const SizedBox();
        }
        if ((state.ourVisionData?.knowMoreAboutOurService?.ctaBgImg?.url ?? '')
            .isEmpty) {
          return const SizedBox();
        }
        return KnowMoreWidget(
          videoUrl:
              state.ourVisionData?.knowMoreAboutOurService?.ctaBgImg?.url ?? '',
          header: state.ourVisionData?.knowMoreAboutOurService?.ctaTitle ?? '',
          buttonText:
              state.ourVisionData?.knowMoreAboutOurService?.ctaLink?.label ??
                  '',
          onTap: () {
            context.goNamed(RouteConstants.contactUsScreenPath);
          },
        );
      },
    );
  }
}
