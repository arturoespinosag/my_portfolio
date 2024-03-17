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

  @override
  void initState() {
    _cvvFocusNode = FocusNode()..addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    _cvvFocusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  void _onFocusChange() =>
      context.read<CreditCardBloc>().add(const CreditCardEvent.cardAnimated());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final years = List.generate(5, (index) => 2024 + index);
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
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          keyboardType: TextInputType.number,
                          maxLength: 16,
                        ),
                        const SizedBox(height: 20),
                        const Text('Account holder'),
                        const CustomTextFormField(),
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
                                      const CustomDropDown(items: months),
                                      const SizedBox(width: 8),
                                      CustomDropDown(items: years),
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

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
  });

  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 10,
      shadowColor: Colors.black45,
      child: TextFormField(
        focusNode: focusNode,
        keyboardType: keyboardType,
        maxLength: maxLength,
        buildCounter: (
          _, {
          required currentLength,
          required isFocused,
          required maxLength,
        }) =>
            null,
        inputFormatters: inputFormatters,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({required this.items, super.key});

  final List<T> items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PhysicalModel(
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.black45,
        child: DropdownButtonFormField<T>(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black45),
            ),
            border: OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          ),
          value: items.first,
          items: items
              .map(
                (value) => DropdownMenuItem<T>(
                  value: value,
                  child: Text(value.toString()),
                ),
              )
              .toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
