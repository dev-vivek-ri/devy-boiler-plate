import 'package:devy_boiler_plate/utils/constant/dimension.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  const ResponsiveLayout(
      {super.key,
      required this.mobileLayout,
      required this.tabletLayout,
      required this.desktopLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > desktopWidth) {
        return desktopLayout;
      } else if (constraints.maxWidth > tabletWidth &&
          constraints.maxWidth < desktopWidth) {
        return tabletLayout;
      } else {
        return mobileLayout;
      }
    });
  }
}
