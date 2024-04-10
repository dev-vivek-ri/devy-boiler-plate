import 'package:flutter/material.dart';

class AppLabelField extends StatelessWidget {
  final String label;
  final String value;

  const AppLabelField({
    super.key,
    required this.label,
    this.value = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelSmall),
          Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
