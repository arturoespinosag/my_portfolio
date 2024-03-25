import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:portfolio/credit_card/credit_card.dart';

class CreditCardWidget extends StatefulWidget {
  const CreditCardWidget({super.key});

  @override
  State<CreditCardWidget> createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Tween<double> _tween;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _tween = Tween(begin: 0, end: 1);
    _animation = _tween.animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreditCardBloc, CreditCardState>(
      listenWhen: (p, c) => p.animateCard != c.animateCard,
      listener: (context, state) {
        if (state.animateCard) {
          if (state.cardSide == CardSide.front) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        }
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                _animation.value < 0.5
                    ? pi * _animation.value
                    : pi * (1 + _animation.value),
              ),
            child: Card(
              elevation: 5,
              shadowColor: _animation.value == 0 || _animation.value == 1
                  ? Colors.black
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.all(20),
              child: Container(
                height: 200,
                width: 318.5,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFE5F55),
                      Color(0xFFE63462),
                    ],
                  ),
                ),
                child: _animation.value < 0.5
                    ? const CreditCardFront()
                    : const CreditCardBack(),
              ),
            ),
          );
        },
      ),
    );
  }
}
