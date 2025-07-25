import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vcyberiz/core/utils/config/config.dart';
import 'package:vcyberiz/core/utils/constants/constants.dart';
import 'package:vcyberiz/core/utils/styles/app_colors.dart';

class GifWidget extends StatelessWidget {
  final String imageUrl;
  final String label;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final Alignment? alignment;

  const GifWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.color,
    this.alignment,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      (dotenv.env[Constants.assetBaseURL] ?? "") + imageUrl,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment ?? Alignment.center,
      color: color,
      errorBuilder: (context, error, stackTrace) => SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imageUrl;
  final String label;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final Alignment? alignment;

  const ImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    this.color,
    this.alignment,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      (dotenv.env[Constants.assetBaseURL] ?? "") + imageUrl,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment ?? Alignment.center,
      color: color,
      errorBuilder: (context, error, stackTrace) => SizedBox(
        height: height,
        width: width,
        child: Center(
          child: kStyle.med(
            text: label,
            size: 14,
            color: AppColors.black,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

CachedNetworkImageProvider decorationImageProviderWidget(
  String imageUrl,
  String label,
) {
  return CachedNetworkImageProvider(
    (dotenv.env[Constants.assetBaseURL] ?? "") + imageUrl,
  );
}
