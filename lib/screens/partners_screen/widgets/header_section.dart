import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/partners_bloc/partners_bloc.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';
import 'package:vcyberiz/core/utils/styles/text_styles.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PartnersBloc, PartnersState>(
      builder: (context, state) {
//!---------------------image container
        return Container(
          width: Constants.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                state.headerData?.secBg?.url ?? "",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: SizedBox(
              height: getValueForScreenType(
                context: context,
                mobile: 200,
                desktop: 400,
                tablet: 400,
              ),
              width: getValueForScreenType<double>(
                context: context,
                mobile: Constants.width,
                tablet: Constants.width * 0.92,
                desktop: Constants.desktopBreakPoint,
              ),
              //!---------------------section heading
              child: Center(
                child: Kstyles().bold(
                  text: state.headerData?.secHeader ?? '',
                  size: getValueForScreenType(
                      context: context, mobile: 15, desktop: 50, tablet: 25),
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
