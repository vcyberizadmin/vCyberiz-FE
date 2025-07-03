import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class CustomImageNetworkWidget extends StatelessWidget {
  const CustomImageNetworkWidget({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.boxFit,
    this.loaderBgColor,
  });
  final double? width;
  final double? height;
  final String imageUrl;
  final BoxFit? boxFit;
  final Color? loaderBgColor;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: height,
              width: width,
              color: loaderBgColor ?? Colors.white,
            ),
          );
        }
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return SizedBox(
          height: height,
          width: width,
          child: const Center(
            child: Icon(
              Icons.error,
              color: AppColors.red,
            ),
          ),
        );
      },
      height: height,
      width: width,
      fit: boxFit,
    );
  }
}
