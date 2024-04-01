import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants.dart';
import 'package:portfolio/credit_card/credit_card.dart';
import 'package:portfolio/gen/assets.gen.dart';

class CreditCardFront extends StatelessWidget {
  const CreditCardFront({super.key});

  @override
  Widget build(BuildContext context) {
    var expireDate = '00/00';
    var oldCardNumber = '0000000000000000';
    var oldExpirationDate = '00/00';

    return BlocBuilder<CreditCardBloc, CreditCardState>(
      buildWhen: (p, c) {
        if (p.cardNumber != c.cardNumber) {
          oldCardNumber = p.cardNumber;
          return true;
        }
        if (p.expirationMonth != c.expirationMonth) {
          oldExpirationDate = '${p.expirationMonth}/${c.expirationYear}';
          return true;
        }
        if (p.expirationYear != c.expirationYear) {
          oldExpirationDate = '${c.expirationMonth}/${p.expirationYear}';
          return true;
        }

        return p.selectedField != c.selectedField ||
            p.customerName != c.customerName;
      },
      builder: (context, state) {
        expireDate = '${state.expirationMonth}/${state.expirationYear}';
        final params = _getPositionedParams(state.selectedField);
        final cardNumber = state.cardNumber;
        const duration = Duration(milliseconds: 300);

        var spacesAdded = 0;
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Stack(
            children: [
              AnimatedPositioned(
                top: params?.top,
                left: params?.left,
                duration: duration,
                child: AnimatedContainer(
                  duration: params == null ? Duration.zero : duration,
                  height: params?.height ?? 0,
                  width: params?.width ?? 0,
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
                  Row(
                    children: [
                      const Text(' '),
                      ...List.generate(cardNumber.length + 3, (index) {
                        if (index == 4 || index == 9 || index == 14) {
                          spacesAdded++;
                          return const Text('    ');
                        }

                        return AnimatedLetter(
                          value: cardNumber[index - spacesAdded],
                          oldValue: oldCardNumber[index - spacesAdded],
                        );
                      }),
                    ],
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
                          Row(
                            children: List.generate(
                              expireDate.length,
                              (index) => AnimatedLetter(
                                value: expireDate[index],
                                oldValue: oldExpirationDate[index],
                                textStyle: kMetallicTextStyle.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(' '),
                          ...List.generate(
                            state.customerName.length,
                            (index) {
                              return AnimatedLetter(
                                value: state.customerName[index].toUpperCase(),
                                oldValue: '',
                                isHorizontalAnimation: true,
                                textStyle: kMetallicTextStyle.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              );
                            },
                          ),
                        ],
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
