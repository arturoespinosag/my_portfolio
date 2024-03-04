import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants.dart';
import 'package:portfolio/credit_card/credit_card.dart';
import 'package:portfolio/gen/assets.gen.dart';

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

class CreditCardFront extends StatelessWidget {
  const CreditCardFront({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'BANK NAME',
              style: kMetallicTextStyle.copyWith(shadows: []),
            ),
          ),
          Assets.pngs.cardChip.image(width: 40),
          const Text(
            '0000 0000 0000 0000',
            style: kMetallicTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'EXPIRE\nDATE',
                style: kMetallicTextStyle.copyWith(fontSize: 5),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '00/00',
                style: kMetallicTextStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Arturo Espinosa',
                style: kMetallicTextStyle.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
              Assets.pngs.visaWhite.image(height: 26),
            ],
          ),
        ],
      ),
    );
  }
}

class CreditCardBack extends StatelessWidget {
  const CreditCardBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 8),
          child: Text(
            'For customer service, call +123-456-789 ',
            style: normalTextStyle.copyWith(
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
          height: 50,
          width: double.infinity,
          child: ColoredBox(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 30,
          width: double.infinity,
          child: const Align(
            alignment: Alignment.centerRight,
            child: Text('000'),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Text(
                loremIpsum,
                maxLines: 3,
                style: normalTextStyle.copyWith(fontSize: 5),
              ),
              const SizedBox(height: 5),
              Text(
                loremIpsum,
                maxLines: 3,
                style: normalTextStyle.copyWith(fontSize: 5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
