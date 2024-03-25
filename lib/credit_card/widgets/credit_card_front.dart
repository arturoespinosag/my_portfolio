import 'package:flutter/material.dart';
import 'package:portfolio/core/constants.dart';
import 'package:portfolio/gen/assets.gen.dart';

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
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.white,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: const Text(
              '0000   0000   0000   0000',
              style: kMetallicTextStyle,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(
                flex: 4,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
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
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                child: Text(
                  'ARTURO ESPINOSA GOMEZ',
                  style: kMetallicTextStyle.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
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
