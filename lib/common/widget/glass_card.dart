import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;

  const GlassCard({super.key, this.width, this.height, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0), // Adjust the radius
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        // Adjust the blur amount
        child: Container(
          padding: const EdgeInsets.all(20),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2), // Adjust the opacity
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: Colors.white.withOpacity(0.2)), // Optional border
          ),
          child: child,
        ),
      ),
    );
  }
}
