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
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(isSelected ? 0.2 : 0),
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border.all(
                color: Colors.white,
              )
            : null,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: verticalPadding,
      ),
      child: child,
    );
  }
}
