import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/core/constants.dart';

part 'credit_card_bloc.freezed.dart';
part 'credit_card_event.dart';
part 'credit_card_state.dart';

class CreditCardBloc extends Bloc<CreditCardEvent, CreditCardState> {
  CreditCardBloc() : super(const CreditCardState()) {
    on<_CardAnimated>(_onCardAnimated);
    on<_FieldChanged>(_onFieldChanged);
    on<_CreditCardChanged>(_onCreditCardChanged);
    on<_ExpirationMonthChanged>(_onExpirationMonthChanged);
    on<_ExpirationYearChanged>(_onExpirationYearChanged);
    on<_NameChanged>(_onNameChanged);
    on<_CvvNumberChanged>(_onCvvNameChanged);
  }

  void _onCardAnimated(_CardAnimated event, Emitter<CreditCardState> emit) {
    emit(
      state.copyWith(
        animateCard: true,
      ),
    );
    emit(
      state.copyWith(
        animateCard: false,
        cardSide:
            state.cardSide == CardSide.front ? CardSide.back : CardSide.front,
      ),
    );
  }

  void _onFieldChanged(_FieldChanged event, Emitter<CreditCardState> emit) {
    emit(
      state.copyWith(
        selectedField: event.field,
      ),
    );
  }

  void _onCreditCardChanged(
    _CreditCardChanged event,
    Emitter<CreditCardState> emit,
  ) {
    final cardNumber = event.value.padRight(16, '0');
    emit(
      state.copyWith(
        cardNumber: cardNumber,
      ),
    );
  }

  void _onExpirationMonthChanged(
    _ExpirationMonthChanged event,
    Emitter<CreditCardState> emit,
  ) {
    final eventMonth = event.value;
    final index = months.indexWhere((month) => month == eventMonth);
    final expirationDate = monthsNumbers[index];
    emit(
      state.copyWith(
        expirationMonth: expirationDate,
      ),
    );
  }

  void _onExpirationYearChanged(
    _ExpirationYearChanged event,
    Emitter<CreditCardState> emit,
  ) {
    final expirationYear = event.value.substring(2);
    emit(
      state.copyWith(
        expirationYear: expirationYear,
      ),
    );
  }

  void _onNameChanged(_NameChanged event, Emitter<CreditCardState> emit) {
    emit(
      state.copyWith(
        customerName: event.value,
      ),
    );
  }

  void _onCvvNameChanged(
    _CvvNumberChanged event,
    Emitter<CreditCardState> emit,
  ) {
    final cvvNumber = event.value.padRight(3, '0');
    emit(state.copyWith(cvvNumber: cvvNumber));
  }
}
