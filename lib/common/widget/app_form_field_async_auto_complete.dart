import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AppFormFieldAsyncAutoComplete<T> extends StatelessWidget {
  final Future<List<T>> Function(String) suggestionsCallback;
  final Widget Function(BuildContext, T) itemBuilder;
  final void Function(T) onSelected;
  final String? labelText;
  final String? intialValue;
  final bool? isReadOnly;
  const AppFormFieldAsyncAutoComplete({
    super.key,
    required this.suggestionsCallback,
    required this.itemBuilder,
    required this.onSelected,
    this.intialValue = '',
    this.labelText = '',
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<T>(
      controller: TextEditingController(
        text: intialValue,
      ),
      suggestionsCallback: suggestionsCallback,
      builder: (context, controller, focusNode) {
        return TextField(
            controller: controller,
            focusNode: focusNode,
            autofocus: true,
            enabled: !isReadOnly!,
            readOnly: isReadOnly!,
            decoration: InputDecoration(labelText: labelText));
      },
      debounceDuration: const Duration(milliseconds: 1000),
      itemBuilder: (context, suggestion) {
        return itemBuilder(context, suggestion);
      },
      onSelected: onSelected,
    );
  }
}
