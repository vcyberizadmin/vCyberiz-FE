import 'package:flutter/widgets.dart';

class LineWithCircle extends StatelessWidget {
  final double lineWidth; // Length of the line
  final Color lineColor; // Color of the line
  final double circleRadius; // Radius of the circle
  final Color circleColor; // Color of the circle
  final bool isReversed; // Whether the widget is reversed

  const LineWithCircle({
    super.key,
    this.lineWidth = 50, // Default width of the line
    required this.lineColor, // Default line color
    this.circleRadius = 4, // Default circle radius
    required this.circleColor, // Default circle color
    this.isReversed = false, // Default: Not reversed
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _LineWithCirclePainter(
        lineWidth: lineWidth,
        lineColor: lineColor,
        circleRadius: circleRadius,
        circleColor: circleColor,
        isReversed: isReversed,
      ),
      child: SizedBox(
        width: lineWidth + circleRadius * 2, // Account for circle width
        height: circleRadius * 2, // Height to fit the circle
      ),
    );
  }
}

class _LineWithCirclePainter extends CustomPainter {
  final double lineWidth;
  final Color lineColor;
  final double circleRadius;
  final Color circleColor;
  final bool isReversed;

  _LineWithCirclePainter({
    required this.lineWidth,
    required this.lineColor,
    required this.circleRadius,
    required this.circleColor,
    required this.isReversed,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final Paint circlePaint = Paint()
      ..color = circleColor
      ..style = PaintingStyle.fill;

    if (isReversed) {
      // Reverse: Draw circle first, then line
      canvas.drawCircle(
        Offset(0, size.height / 2), // Circle at the start
        circleRadius,
        circlePaint,
      );

      canvas.drawLine(
        Offset(circleRadius * 2, size.height / 2),
        Offset(size.width, size.height / 2), // Line extends to the end
        linePaint,
      );
    } else {
      // Normal: Draw line first, then circle
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(lineWidth, size.height / 2), // Line extends to the end
        linePaint,
      );

      canvas.drawCircle(
        Offset(lineWidth, size.height / 2), // Circle at the end
        circleRadius,
        circlePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No repaint needed for static UI
  }
}
