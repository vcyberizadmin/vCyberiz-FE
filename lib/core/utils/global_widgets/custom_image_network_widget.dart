import 'package:flutter/material.dart';

import 'image_widget.dart';

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
    return ImageWidget(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: boxFit,
    );
  }
}
