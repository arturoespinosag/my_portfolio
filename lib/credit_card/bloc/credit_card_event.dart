part of 'credit_card_bloc.dart';

@freezed
class CreditCardEvent with _$CreditCardEvent {
  const factory CreditCardEvent.cardAnimated() = _CardAnimated;
}
