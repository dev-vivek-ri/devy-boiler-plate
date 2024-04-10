import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget widget;
  final double marginH, marginV;
  final bool isBorder;
  final bool circularBorderTop;

  const CustomCard({
    super.key,
    required this.widget,
    this.marginH = 20,
    this.marginV = 10,
    this.isBorder = true,
    this.circularBorderTop = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: isBorder
            ? Theme.of(context).colorScheme.onSecondary
            : Theme.of(context).colorScheme.secondaryContainer,
        elevation: isBorder ? 1 : 10,
        margin: EdgeInsets.symmetric(horizontal: marginH, vertical: marginV),
        shape: RoundedRectangleBorder(
          side: isBorder
              ? BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 0.5)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: widget));
  }
}
