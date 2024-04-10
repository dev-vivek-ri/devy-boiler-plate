import 'package:flutter/material.dart';

class UnderReview extends StatelessWidget {
  const UnderReview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Chip(
          backgroundColor: Colors.orange,
          side: BorderSide(color: Colors.orange, width: 1),
          label: Text('Under Review', style: TextStyle(color: Colors.white))),
    );
  }
}
