import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';

import '../../../bloc/about_us_bloc/about_us_bloc.dart';
import '../../../core/utils/styles/app_colors.dart';

class AboutVcyberizSection extends StatelessWidget {
  const AboutVcyberizSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsBloc, AboutUsState>(
      builder: (context, state) {
        if (state.loading) {
          return const SizedBox();
        }
        return Container(
          width: Constants.width,
          height: getValueForScreenType(
            context: context,
            mobile: 200,
            desktop: 400,
            tablet: 300,
          ),
          color: AppColors.blue,
          child: Center(
            child: Container(
              width: Constants.videoBreakPoint,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: CachedNetworkImageProvider(
                  state.headerData?.secBg?.url ?? '',
                ),
              )),
              child: Center(
                child: SizedBox(
                    width: getValueForScreenType<double>(
                      context: context,
                      mobile: Constants.width,
                      tablet: Constants.width * .92,
                      desktop: Constants.desktopBreakPoint,
                    ),
                    child: Center(
                      child: Kstyles().med(
                        text: state.headerData?.secHeader ?? '',
                        size: getValueForScreenType(
                          context: context,
                          mobile: 30,
                          desktop: 50,
                          tablet: 40,
                        ),
                        color: AppColors.white,
                        textAlign: TextAlign.left,
                      ),
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
