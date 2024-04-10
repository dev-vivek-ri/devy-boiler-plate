import 'package:devy_boiler_plate/common/widget/app_sized_box.dart';
import 'package:flutter/material.dart';

class AppNotificationLabel extends StatefulWidget {
  const AppNotificationLabel({super.key});

  @override
  State<AppNotificationLabel> createState() => _AppNotificationLabelState();
}

class _AppNotificationLabelState extends State<AppNotificationLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: const Column(
          children: [
            Row(
              children: [
                Icon(Icons.notifications),
                AppSizedBox.sizedw5,
                Text('You have an active crop seminar ongoing'),
              ],
            ),
          ],
        ));
  }
}
