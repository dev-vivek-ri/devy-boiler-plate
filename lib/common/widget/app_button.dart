import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onClick;
  final Color? backGroundColor;
  final Color? textColor;
  final IconData? icon;
  final IconData? leadingIcon;
  final bool isDisable;

  const AppButton(
      {super.key,
      required this.buttonName,
      required this.onClick,
      this.textColor,
      this.backGroundColor,
      this.leadingIcon,
      this.isDisable = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor:
              backGroundColor ?? Theme.of(context).colorScheme.primary,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFFc78c06), width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(5)))),
      onPressed: isDisable ? null : () => onClick(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingIcon != null)
            Icon(leadingIcon,
                color: textColor ?? Theme.of(context).colorScheme.onPrimary),
          Text(
            buttonName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: textColor ?? Theme.of(context).colorScheme.onPrimary),
          ),
          if (icon != null)
            Icon(icon,
                color: textColor ?? Theme.of(context).colorScheme.onPrimary),
        ],
      ),
    );
  }
}
