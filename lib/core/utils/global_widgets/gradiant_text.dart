import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:vcyberiz/core/utils/config/config.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;

  const GradientText({
    super.key,
    required this.text,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      blendMode: BlendMode.srcIn,
      child: kStyle.bold(
        text: text,
        size: getValueForScreenType(
          context: context,
          mobile: 35,
          tablet: 35,
          desktop: 35,
        ),
      ),
    );
  }
}
