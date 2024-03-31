import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/constants.dart';

import 'package:portfolio/credit_card/credit_card.dart';

class CreditCardView extends StatefulWidget {
  const CreditCardView({super.key});

  @override
  State<CreditCardView> createState() => _CreditCardViewState();
}

class _CreditCardViewState extends State<CreditCardView> {
  late FocusNode _cvvFocusNode;
  late FocusNode _cardFocusNode;
  late FocusNode _nameFocusNode;
  late FocusNode _expireDateFocusNode;
  late TextEditingController _cardController;

  @override
  void initState() {
    _cvvFocusNode = FocusNode()..addListener(_onCvvFocusChange);
    _cardFocusNode = FocusNode()..addListener(_onCardFocusChange);
    _nameFocusNode = FocusNode()..addListener(_onNameFocusChange);
    _expireDateFocusNode = FocusNode()..addListener(_onExpireDateFocusChange);
    _cardController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _cvvFocusNode
      ..removeListener(_onCvvFocusChange)
      ..dispose();
    _cardFocusNode.removeListener(_onCardFocusChange);
    _nameFocusNode.removeListener(_onNameFocusChange);
    _expireDateFocusNode.removeListener(_onExpireDateFocusChange);
    _cardController.dispose();

    super.dispose();
  }

  void _onCvvFocusChange() {
    if (_cvvFocusNode.hasFocus) {
      context.read<CreditCardBloc>().add(const CreditCardEvent.fieldChanged());
    }
    context.read<CreditCardBloc>().add(const CreditCardEvent.cardAnimated());
  }

  void _onNameFocusChange() {
    if (_nameFocusNode.hasFocus) {
      context.read<CreditCardBloc>().add(
            const CreditCardEvent.fieldChanged(
              field: SelectedField.customerName,
            ),
          );
    }
  }

  void _onCardFocusChange() {
    if (_cardFocusNode.hasFocus) {
      context.read<CreditCardBloc>().add(
            const CreditCardEvent.fieldChanged(
              field: SelectedField.cardNumber,
            ),
          );
    }
  }

  void _onExpireDateFocusChange() {
    if (_expireDateFocusNode.hasFocus) {
      context.read<CreditCardBloc>().add(
            const CreditCardEvent.fieldChanged(
              field: SelectedField.expireDate,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final years = List.generate(5, (index) => (2024 + index).toString());
    final hPadding = (kIsWeb ? size.width * 0.22 : 25).toDouble();
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      appBar: AppBar(title: const Text('Credit card')),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.only(
                top: size.height * 0.14,
                left: hPadding,
                right: hPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 15,
                    spreadRadius: 10,
                    color: Colors.black12,
                  ),
                ],
              ),
              height: 500,
              width: 600,
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CreditCardWidget(),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: hPadding + 20,
                      right: hPadding + 20,
                      bottom: 20,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Card number'),
                        CustomTextFormField(
                          controller: _cardController,
                          focusNode: _cardFocusNode,
                          onChanged: (value) {
                            context.read<CreditCardBloc>().add(
                                  CreditCardEvent.creditCardChanged(
                                    value: value,
                                  ),
                                );
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          keyboardType: TextInputType.number,
                          maxLength: 16,
                        ),
                        const SizedBox(height: 20),
                        const Text('Account holder'),
                        CustomTextFormField(
                          focusNode: _nameFocusNode,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              flex: kIsWeb ? 2 : 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Expiration date'),
                                  Row(
                                    children: [
                                      CustomDropDown(
                                        items: months,
                                        focusNode: _expireDateFocusNode,
                                        onChanged: (value) {
                                          context.read<CreditCardBloc>().add(
                                                CreditCardEvent
                                                    .expirationMonthChanged(
                                                  value: value ?? 'January',
                                                ),
                                              );
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                      CustomDropDown(
                                        items: years,
                                        focusNode: _expireDateFocusNode,
                                        onChanged: (value) =>
                                            context.read<CreditCardBloc>().add(
                                                  CreditCardEvent
                                                      .expirationYearChanged(
                                                    value: value ?? '2024',
                                                  ),
                                                ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('CVV'),
                                  CustomTextFormField(
                                    focusNode: _cvvFocusNode,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'),
                                      ),
                                    ],
                                    maxLength: 3,
                                    keyboardType: TextInputType.number,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
