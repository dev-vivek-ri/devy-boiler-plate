import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double height;
  final double width;

  const LogoWidget({super.key, this.height = 80, this.width = 300});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/flutter_logo.png',
      width: width,
      height: height,
    );
  }
}
