part of 'credit_card_bloc.dart';

enum CardSide {
  front,
  back,
}

@freezed
class CreditCardState with _$CreditCardState {
  const factory CreditCardState({
    @Default(false) bool animateCard,
    @Default(CardSide.front) CardSide cardSide,
  }) = _CreditCardState;
}
