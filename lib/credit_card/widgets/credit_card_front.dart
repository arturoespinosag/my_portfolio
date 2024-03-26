import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants.dart';
import 'package:portfolio/credit_card/credit_card.dart';
import 'package:portfolio/gen/assets.gen.dart';

class CreditCardFront extends StatelessWidget {
  const CreditCardFront({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreditCardBloc, CreditCardState, SelectedField?>(
      selector: (state) {
        return state.selectedField;
      },
      builder: (context, selectedField) {
        final params = _getPositionedParams(selectedField);
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Stack(
            children: [
              AnimatedPositioned(
                top: params?.top,
                left: params?.left,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  height: params?.height,
                  width: params?.width,
                  decoration: BoxDecoration(
                    color: params != null
                        ? Colors.black.withOpacity(0.2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: params != null
                        ? Border.all(
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ),
              Column(
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
                    ' 0000   0000   0000   0000',
                    style: kMetallicTextStyle,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Spacer(
                        flex: 4,
                      ),
                      Row(
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
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' ARTURO ESPINOSA GOMEZ',
                        style: kMetallicTextStyle.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      Assets.pngs.visaWhite.image(height: 26),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

PositionedParams? _getPositionedParams(SelectedField? field) {
  if (field == null) return null;
  switch (field) {
    case SelectedField.cardNumber:
      return PositionedParams(
        top: 75,
        width: 241,
        height: 27,
      );
    case SelectedField.expireDate:
      return PositionedParams(
        top: 102,
        left: 127,
        width: 80,
        height: 22,
      );

    case SelectedField.customerName:
      return PositionedParams(
        top: 123,
        width: 187,
        height: 27,
      );
  }
}

class PositionedParams {
  PositionedParams({
    required this.height,
    required this.width,
    this.top = 0,
    this.left = 0,
  });

  final double top;
  final double left;
  final double height;
  final double width;
}
