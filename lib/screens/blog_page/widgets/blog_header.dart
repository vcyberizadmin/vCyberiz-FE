import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/bloc/blogs_bloc/blogs_bloc.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/global_widgets/image_widget.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class BlogHeaderSection extends StatelessWidget {
  const BlogHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogsBloc, BlogsState>(
      builder: (context, state) {
        return Container(
          width: Constants.width,
          child: Center(
            child: Container(
              width: Constants.videoBreakPoint,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: decorationImageProviderWidget(
                      state.headerData?.secHeader?.secBg?.first.url ?? ""),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: SizedBox(
                  height: getValueForScreenType(
                    context: context,
                    mobile: 200,
                    desktop: 550,
                    tablet: 400,
                  ),
                  width: getValueForScreenType<double>(
                    context: context,
                    mobile: Constants.width * .94,
                    tablet: Constants.width * 0.92,
                    desktop: Constants.desktopBreakPoint,
                  ),
                  //!---------------mobile
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kStyle.bold(
                        text: state.headerData?.secHeader?.secBg?.first.name ??
                            "",
                        size: getValueForScreenType(
                          context: context,
                          mobile: 18,
                          desktop: 60,
                          tablet: 50,
                        ),
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
