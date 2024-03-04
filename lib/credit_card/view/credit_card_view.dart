import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/credit_card/credit_card.dart';

class CreditCardView extends StatefulWidget {
  const CreditCardView({super.key});

  @override
  State<CreditCardView> createState() => _CreditCardViewState();
}

class _CreditCardViewState extends State<CreditCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Credit card')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Credit card',
              style: TextStyle(color: Colors.white),
            ),
            const CreditCardWidget(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context
                  .read<CreditCardBloc>()
                  .add(const CreditCardEvent.cardAnimated()),
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}
