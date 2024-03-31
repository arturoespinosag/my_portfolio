import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants.dart';
import 'package:portfolio/credit_card/bloc/credit_card_bloc.dart';
import 'package:portfolio/credit_card/credit_card.dart';

class CreditCardBack extends StatelessWidget {
  const CreditCardBack({super.key});

  @override
  Widget build(BuildContext context) {
    var oldCvvNumber = '000';
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
          child: BlocBuilder<CreditCardBloc, CreditCardState>(
            buildWhen: (p, c) {
              if (p.cvvNumber != c.cvvNumber) {
                oldCvvNumber = p.cvvNumber;
              }
              return p.cvvNumber != c.cvvNumber;
            },
            builder: (context, state) {
              final cvvNumber = state.cvvNumber;
              return Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(
                    cvvNumber.length,
                    (index) => AnimatedLetter(
                      value: cvvNumber[index],
                      oldValue: oldCvvNumber[index],
                      textStyle: null,
                    ),
                  ),
                ),
              );
            },
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
