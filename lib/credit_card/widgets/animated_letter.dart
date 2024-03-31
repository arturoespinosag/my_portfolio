import 'package:flutter/material.dart';
import 'package:portfolio/core/constants.dart';

class AnimatedLetter extends StatefulWidget {
  const AnimatedLetter({
    required this.value,
    required this.oldValue,
    super.key,
  });

  final String value;
  final String oldValue;

  @override
  State<AnimatedLetter> createState() => _AnimatedLetterState();
}

class _AnimatedLetterState extends State<AnimatedLetter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        key: Key(widget.value),
        duration: const Duration(milliseconds: 300),
        builder: (context, tween, _) {
          return Stack(
            children: [
              Opacity(
                opacity: 1 - tween,
                child: Transform.translate(
                  offset: Offset(0, 10 * tween),
                  child: Text(
                    widget.oldValue,
                    style: kMetallicTextStyle,
                  ),
                ),
              ),
              Opacity(
                opacity: tween,
                child: Transform.translate(
                  offset: Offset(0, -10 * (1 - tween)),
                  child: Text(
                    widget.value,
                    style: kMetallicTextStyle,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
