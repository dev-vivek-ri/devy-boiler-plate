import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final bool isReadOnly;
  final String? hintText;
  final String? errorMessage;
  final IconData? icon;
  final int? maxLines;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final InputBorder? border;
  const AppFormField(
      {super.key,
      required this.label,
      this.isReadOnly = false,
      this.isPassword = false,
      this.icon,
      this.maxLines = 1,
      this.border,
      this.controller,
      this.onChanged,
      this.errorMessage,
      this.hintText,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: isReadOnly
            ? InputBorder.none
            : border ??
                UnderlineInputBorder(
                    borderSide: BorderSide(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.onSurface,
                )),
        disabledBorder: isReadOnly
            ? InputBorder.none
            : border ??
                UnderlineInputBorder(
                    borderSide: BorderSide(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.onSurface,
                )),
        enabledBorder: isReadOnly
            ? InputBorder.none
            : border ??
                UnderlineInputBorder(
                    borderSide: BorderSide(
                  width: 0.5,
                  color: Theme.of(context).colorScheme.onSurface,
                )),
        icon: icon != null ? Icon(icon) : null,
        labelText: label,
        hintText: hintText,
      ),
      maxLines: maxLines,
      readOnly: isReadOnly,
      obscureText: isPassword,
      onChanged: (value) {
        onChanged!(value);
      },
      onSaved: (String? value) {
        onChanged!(value!);
      },
      validator: errorMessage != null
          ? (String? value) {
              if (value == null || value.isEmpty) {
                return errorMessage;
              }
              return null;
            }
          : null,
      onFieldSubmitted: (value) {},
    );
  }
}
