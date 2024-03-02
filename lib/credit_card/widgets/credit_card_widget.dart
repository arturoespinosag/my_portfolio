import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/constants.dart';
import 'package:portfolio/gen/assets.gen.dart';

class CreditCardWidget extends StatefulWidget {
  const CreditCardWidget({required this.value, super.key});

  final double value;

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
      duration: const Duration(milliseconds: 5000),
    )..forward();
    _tween = Tween(begin: 0, end: 1);
    _animation = _tween.animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.all(20),
        child: Container(
          height: 200,
          width: 318.5,
          padding: const EdgeInsets.all(25),
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
  }
}

class CreditCardFront extends StatelessWidget {
  const CreditCardFront({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Assets.pngs.cardChip.image(width: 50),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '0000 0000 0000 0000',
          style: kTextStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Arturo Espinosa',
          style: kTextStyle.copyWith(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

class CreditCardBack extends StatelessWidget {
  const CreditCardBack({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Back of the card',
          style: kTextStyle,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
