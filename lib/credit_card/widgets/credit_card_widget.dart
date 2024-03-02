import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/constants.dart';
import 'package:portfolio/gen/assets.gen.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({required this.value, super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(value < 0.5 ? pi * value : pi * (1 + value)),
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
          child: value < 0.5 ? const CreditCardFront() : const CreditCardBack(),
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
