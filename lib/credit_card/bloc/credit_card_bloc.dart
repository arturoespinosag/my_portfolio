import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_bloc.freezed.dart';
part 'credit_card_event.dart';
part 'credit_card_state.dart';

class CreditCardBloc extends Bloc<CreditCardEvent, CreditCardState> {
  CreditCardBloc() : super(const CreditCardState()) {
    on<_CardAnimated>(_onCardAnimated);
    on<_FieldChanged>(_onFieldChanged);
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
}
