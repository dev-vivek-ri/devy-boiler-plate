import 'package:flutter/material.dart';

class GradientCard extends StatefulWidget {
  final Widget widget;
  const GradientCard({
    super.key,
    required this.widget,
  });

  @override
  State<GradientCard> createState() => _GradientCardState();
}

class _GradientCardState extends State<GradientCard> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff62a6ee),
                Color(0xff77b9f5),
                Color(0xff5374e8), // Three gradient colors
              ],
            ),
          ),
          child: widget.widget,
        ),
      ),
    );
  }
}
