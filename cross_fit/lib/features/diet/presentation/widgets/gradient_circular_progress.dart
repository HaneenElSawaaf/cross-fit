import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;
  final double value;

  const GradientCircularProgressIndicator({super.key,
    this.strokeWidth = 10.0,
    required this.radius,
    required this.gradient,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    double progress = value * 360.0;
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: CustomPaint(
        painter: _GradientCircularProgressPainter(
          strokeWidth: strokeWidth,
          gradient: gradient,
          progress: progress,
        ),
        child: Center(
          child: Text(
            '${(value * 100).toInt()}%',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double strokeWidth;
  final Gradient gradient;
  final double progress;

  _GradientCircularProgressPainter({
    required this.strokeWidth,
    required this.gradient,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..shader = gradient.createShader(Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2.0));
    canvas.drawArc(
      Offset.zero & size,
      -90.0 * (3.14 / 180.0),
      progress * (3.14 / 180.0),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}