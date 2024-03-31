part of 'credit_card_bloc.dart';

enum CardSide {
  front,
  back,
}

enum SelectedField {
  cardNumber,
  expireDate,
  customerName,
}

@freezed
class CreditCardState with _$CreditCardState {
  const factory CreditCardState({
    @Default(false) bool animateCard,
    @Default(CardSide.front) CardSide cardSide,
    SelectedField? selectedField,
    @Default('0000000000000000') String cardNumber,
    @Default('00') String expirationMonth,
    @Default('00') String expirationYear,
  }) = _CreditCardState;
}
