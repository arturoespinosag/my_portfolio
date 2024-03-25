import 'package:flutter/material.dart';
import 'package:portfolio/core/constants.dart';

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
