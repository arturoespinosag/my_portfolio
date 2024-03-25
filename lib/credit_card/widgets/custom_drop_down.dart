import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({required this.items, super.key});

  final List<T> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PhysicalModel(
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.black45,
        child: DropdownButtonFormField<T>(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45),
            ),
            border: OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          ),
          value: items.first,
          items: items
              .map(
                (value) => DropdownMenuItem<T>(
                  value: value,
                  child: Text(value.toString()),
                ),
              )
              .toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
