import 'package:flutter/material.dart';

class DecoratedTextWidget extends StatelessWidget {
  const DecoratedTextWidget({
    required this.child,
    this.verticalPadding = 0,
    this.isSelected = false,
    super.key,
  });
  final Widget child;
  final double verticalPadding;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
