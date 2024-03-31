import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    required this.items,
    required this.hintText,
    this.focusNode,
    super.key,
    this.onChanged,
  });

  final List<T> items;
  final FocusNode? focusNode;
  final void Function(T?)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PhysicalModel(
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.black45,
        child: DropdownButtonFormField<T>(
          focusNode: focusNode,
          isExpanded: true,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45),
            ),
            border: OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          ),
          hint: Text(
            hintText,
            style: const TextStyle(color: Colors.black38),
          ),
          items: items
              .map(
                (value) => DropdownMenuItem<T>(
                  value: value,
                  child: Text(value.toString()),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
