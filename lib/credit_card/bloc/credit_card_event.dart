part of 'credit_card_bloc.dart';

@freezed
class CreditCardEvent with _$CreditCardEvent {
  const factory CreditCardEvent.cardAnimated() = _CardAnimated;
  const factory CreditCardEvent.fieldChanged({
    SelectedField? field,
  }) = _FieldChanged;
  const factory CreditCardEvent.creditCardChanged({required String value}) =
      _CreditCardChanged;
  const factory CreditCardEvent.expirationMonthChanged({
    required String value,
  }) = _ExpirationMonthChanged;
  const factory CreditCardEvent.expirationYearChanged({required String value}) =
      _ExpirationYearChanged;
  const factory CreditCardEvent.nameChanged({required String value}) =
      _NameChanged;
  const factory CreditCardEvent.cvvNumberChanged({required String value}) =
      _CvvNumberChanged;
}
