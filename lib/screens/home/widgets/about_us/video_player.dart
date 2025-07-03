import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../bloc/about_us_bloc/about_us_bloc.dart';
import '../../../../core/utils/constants/asset_constants.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsBloc, AboutUsState>(
      builder: (context, state) {
        return Container(
          width: getValueForScreenType<double>(
            context: context,
            mobile: 200,
            tablet: 350,
            desktop: 500,
          ),
          height: getValueForScreenType<double>(
            context: context,
            mobile: 200,
            tablet: 350,
            desktop: 500,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                state.homeData?.videoUrl?.url ?? '',
              ),
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              AssetConst.playButton,
              width: 60,
              height: 60,
            ),
          ),
        );
      },
    );
  }
}
