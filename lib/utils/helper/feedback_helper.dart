import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Type { success, warning, error }

enum Length { long, short, indefinete }

class FeedbackHelper {
  getColor(Type type) {
    switch (type) {
      case Type.success:
        return Colors.green;
      case Type.warning:
        return Colors.orange;
      case Type.error:
        return Colors.red;
    }
  }

  getLength(Length len) {
    switch (len) {
      case Length.long:
        return const Duration(seconds: 5);
      case Length.short:
        return const Duration(seconds: 2);
      case Length.indefinete:
        return const Duration(days: 1);
    }
  }

  IconData getIconData(Type type) {
    switch (type) {
      case Type.success:
        return Icons.check_circle;
      case Type.warning:
        return Icons.warning;
      case Type.error:
        return Icons.error;
    }
  }

  showSnackBar(BuildContext context, String message,
      {Type type = Type.success, Length length = Length.short}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  getIconData(type),
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    message,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
        backgroundColor: getColor(type),
        duration: getLength(length)));
  }

  showInternet(BuildContext context, bool isOnline) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).clearSnackBars();
      if (!isOnline) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
                width: 10,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context)!.offline,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
          padding: const EdgeInsets.all(2),
          backgroundColor: Colors.red,
          duration: const Duration(days: 2),
        ));
      }
    });
  }
}
