import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final double height;
  final Color? color;
  final double thickness;
  final double dotSpacing;

  const DottedDivider({
    super.key,
    this.height = 1.0,
    this.color,
    this.thickness = 1.0,
    this.dotSpacing = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: _DottedPainter(
            color: color ??
                Theme.of(context).colorScheme.onBackground.withAlpha(100),
            thickness: thickness,
            dotSpacing: dotSpacing),
      ),
    );
  }
}

class _DottedPainter extends CustomPainter {
  final Color color;
  final double thickness;
  final double dotSpacing;

  _DottedPainter({
    required this.color,
    required this.thickness,
    required this.dotSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;

    final double halfDotSpacing = dotSpacing / 2;
    double startX = 0.0;

    while (startX < size.width) {
      canvas.drawLine(
          Offset(startX, 0), Offset(startX + halfDotSpacing, 0), paint);
      startX += dotSpacing;
    }
  }

  @override
  bool shouldRepaint(_DottedPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.thickness != thickness ||
        oldDelegate.dotSpacing != dotSpacing;
  }
}
