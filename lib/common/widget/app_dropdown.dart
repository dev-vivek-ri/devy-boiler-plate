import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppDropdown<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T) displayItem;
  final T? selectedItem;
  final ValueChanged<T?> onChanged;

  const AppDropdown({
    super.key,
    required this.items,
    required this.displayItem,
    required this.onChanged,
    this.selectedItem,
  });

  @override
  AppDropdownState<T> createState() => AppDropdownState<T>();
}

class AppDropdownState<T> extends State<AppDropdown<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: selectedValue,
      hint: Text(AppLocalizations.of(context)!.noItem),
      onChanged: (T? newValue) {
        selectedValue = newValue;
        widget.onChanged(newValue);
      },
      underline: Container(),
      itemHeight: 50,
      items: widget.items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(widget.displayItem(value)),
        );
      }).toList(),
    );
  }
}
