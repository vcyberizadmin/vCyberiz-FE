import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';

class GifWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final Alignment? alignment;
  const GifWidget(
      {super.key,
      required this.imageUrl,
      this.height,
      this.width,
      this.fit,
      this.color,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      (dotenv.env[Constants.assetBaseURL] ?? "") + imageUrl,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment ?? Alignment.center,
      color: color,
      errorBuilder: (context, error, stackTrace) => const SizedBox(),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final Alignment? alignment;
  const ImageWidget(
      {super.key,
      required this.imageUrl,
      this.height,
      this.width,
      this.fit,
      this.color,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      key: key,
      (dotenv.env[Constants.assetBaseURL] ?? "") + imageUrl,
      height: height,
      width: width,
      fit: fit,
      color: color,
      alignment: alignment ?? Alignment.center,
      errorBuilder: (context, error, stackTrace) => const SizedBox(),
    );
  }
}

CachedNetworkImageProvider decorationImageProviderWidget(String imageUrl) {
  return CachedNetworkImageProvider(
    (dotenv.env[Constants.assetBaseURL] ?? "") + imageUrl,
  );
}
