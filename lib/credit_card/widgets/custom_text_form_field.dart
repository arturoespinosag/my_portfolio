import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
  });

  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 10,
      shadowColor: Colors.black45,
      child: TextFormField(
        focusNode: focusNode,
        keyboardType: keyboardType,
        maxLength: maxLength,
        buildCounter: (
          _, {
          required currentLength,
          required isFocused,
          required maxLength,
        }) =>
            null,
        inputFormatters: inputFormatters,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
