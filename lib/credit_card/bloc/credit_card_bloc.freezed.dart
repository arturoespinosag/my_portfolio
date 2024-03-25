// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_card_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreditCardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cardAnimated,
    required TResult Function(SelectedField? field) fieldChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cardAnimated,
    TResult? Function(SelectedField? field)? fieldChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cardAnimated,
    TResult Function(SelectedField? field)? fieldChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardAnimated value) cardAnimated,
    required TResult Function(_FieldChanged value) fieldChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardAnimated value)? cardAnimated,
    TResult? Function(_FieldChanged value)? fieldChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardAnimated value)? cardAnimated,
    TResult Function(_FieldChanged value)? fieldChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardEventCopyWith<$Res> {
  factory $CreditCardEventCopyWith(
          CreditCardEvent value, $Res Function(CreditCardEvent) then) =
      _$CreditCardEventCopyWithImpl<$Res, CreditCardEvent>;
}

/// @nodoc
class _$CreditCardEventCopyWithImpl<$Res, $Val extends CreditCardEvent>
    implements $CreditCardEventCopyWith<$Res> {
  _$CreditCardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CardAnimatedImplCopyWith<$Res> {
  factory _$$CardAnimatedImplCopyWith(
          _$CardAnimatedImpl value, $Res Function(_$CardAnimatedImpl) then) =
      __$$CardAnimatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CardAnimatedImplCopyWithImpl<$Res>
    extends _$CreditCardEventCopyWithImpl<$Res, _$CardAnimatedImpl>
    implements _$$CardAnimatedImplCopyWith<$Res> {
  __$$CardAnimatedImplCopyWithImpl(
      _$CardAnimatedImpl _value, $Res Function(_$CardAnimatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CardAnimatedImpl implements _CardAnimated {
  const _$CardAnimatedImpl();

  @override
  String toString() {
    return 'CreditCardEvent.cardAnimated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CardAnimatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cardAnimated,
    required TResult Function(SelectedField? field) fieldChanged,
  }) {
    return cardAnimated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cardAnimated,
    TResult? Function(SelectedField? field)? fieldChanged,
  }) {
    return cardAnimated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cardAnimated,
    TResult Function(SelectedField? field)? fieldChanged,
    required TResult orElse(),
  }) {
    if (cardAnimated != null) {
      return cardAnimated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardAnimated value) cardAnimated,
    required TResult Function(_FieldChanged value) fieldChanged,
  }) {
    return cardAnimated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardAnimated value)? cardAnimated,
    TResult? Function(_FieldChanged value)? fieldChanged,
  }) {
    return cardAnimated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardAnimated value)? cardAnimated,
    TResult Function(_FieldChanged value)? fieldChanged,
    required TResult orElse(),
  }) {
    if (cardAnimated != null) {
      return cardAnimated(this);
    }
    return orElse();
  }
}

abstract class _CardAnimated implements CreditCardEvent {
  const factory _CardAnimated() = _$CardAnimatedImpl;
}

/// @nodoc
abstract class _$$FieldChangedImplCopyWith<$Res> {
  factory _$$FieldChangedImplCopyWith(
          _$FieldChangedImpl value, $Res Function(_$FieldChangedImpl) then) =
      __$$FieldChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SelectedField? field});
}

/// @nodoc
class __$$FieldChangedImplCopyWithImpl<$Res>
    extends _$CreditCardEventCopyWithImpl<$Res, _$FieldChangedImpl>
    implements _$$FieldChangedImplCopyWith<$Res> {
  __$$FieldChangedImplCopyWithImpl(
      _$FieldChangedImpl _value, $Res Function(_$FieldChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = freezed,
  }) {
    return _then(_$FieldChangedImpl(
      field: freezed == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as SelectedField?,
    ));
  }
}

/// @nodoc

class _$FieldChangedImpl implements _FieldChanged {
  const _$FieldChangedImpl({this.field});

  @override
  final SelectedField? field;

  @override
  String toString() {
    return 'CreditCardEvent.fieldChanged(field: $field)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FieldChangedImpl &&
            (identical(other.field, field) || other.field == field));
  }

  @override
  int get hashCode => Object.hash(runtimeType, field);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FieldChangedImplCopyWith<_$FieldChangedImpl> get copyWith =>
      __$$FieldChangedImplCopyWithImpl<_$FieldChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cardAnimated,
    required TResult Function(SelectedField? field) fieldChanged,
  }) {
    return fieldChanged(field);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? cardAnimated,
    TResult? Function(SelectedField? field)? fieldChanged,
  }) {
    return fieldChanged?.call(field);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cardAnimated,
    TResult Function(SelectedField? field)? fieldChanged,
    required TResult orElse(),
  }) {
    if (fieldChanged != null) {
      return fieldChanged(field);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CardAnimated value) cardAnimated,
    required TResult Function(_FieldChanged value) fieldChanged,
  }) {
    return fieldChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CardAnimated value)? cardAnimated,
    TResult? Function(_FieldChanged value)? fieldChanged,
  }) {
    return fieldChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CardAnimated value)? cardAnimated,
    TResult Function(_FieldChanged value)? fieldChanged,
    required TResult orElse(),
  }) {
    if (fieldChanged != null) {
      return fieldChanged(this);
    }
    return orElse();
  }
}

abstract class _FieldChanged implements CreditCardEvent {
  const factory _FieldChanged({final SelectedField? field}) =
      _$FieldChangedImpl;

  SelectedField? get field;
  @JsonKey(ignore: true)
  _$$FieldChangedImplCopyWith<_$FieldChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreditCardState {
  bool get animateCard => throw _privateConstructorUsedError;
  CardSide get cardSide => throw _privateConstructorUsedError;
  SelectedField? get selectedField => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditCardStateCopyWith<CreditCardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCardStateCopyWith<$Res> {
  factory $CreditCardStateCopyWith(
          CreditCardState value, $Res Function(CreditCardState) then) =
      _$CreditCardStateCopyWithImpl<$Res, CreditCardState>;
  @useResult
  $Res call(
      {bool animateCard, CardSide cardSide, SelectedField? selectedField});
}

/// @nodoc
class _$CreditCardStateCopyWithImpl<$Res, $Val extends CreditCardState>
    implements $CreditCardStateCopyWith<$Res> {
  _$CreditCardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animateCard = null,
    Object? cardSide = null,
    Object? selectedField = freezed,
  }) {
    return _then(_value.copyWith(
      animateCard: null == animateCard
          ? _value.animateCard
          : animateCard // ignore: cast_nullable_to_non_nullable
              as bool,
      cardSide: null == cardSide
          ? _value.cardSide
          : cardSide // ignore: cast_nullable_to_non_nullable
              as CardSide,
      selectedField: freezed == selectedField
          ? _value.selectedField
          : selectedField // ignore: cast_nullable_to_non_nullable
              as SelectedField?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditCardStateImplCopyWith<$Res>
    implements $CreditCardStateCopyWith<$Res> {
  factory _$$CreditCardStateImplCopyWith(_$CreditCardStateImpl value,
          $Res Function(_$CreditCardStateImpl) then) =
      __$$CreditCardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool animateCard, CardSide cardSide, SelectedField? selectedField});
}

/// @nodoc
class __$$CreditCardStateImplCopyWithImpl<$Res>
    extends _$CreditCardStateCopyWithImpl<$Res, _$CreditCardStateImpl>
    implements _$$CreditCardStateImplCopyWith<$Res> {
  __$$CreditCardStateImplCopyWithImpl(
      _$CreditCardStateImpl _value, $Res Function(_$CreditCardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animateCard = null,
    Object? cardSide = null,
    Object? selectedField = freezed,
  }) {
    return _then(_$CreditCardStateImpl(
      animateCard: null == animateCard
          ? _value.animateCard
          : animateCard // ignore: cast_nullable_to_non_nullable
              as bool,
      cardSide: null == cardSide
          ? _value.cardSide
          : cardSide // ignore: cast_nullable_to_non_nullable
              as CardSide,
      selectedField: freezed == selectedField
          ? _value.selectedField
          : selectedField // ignore: cast_nullable_to_non_nullable
              as SelectedField?,
    ));
  }
}

/// @nodoc

class _$CreditCardStateImpl implements _CreditCardState {
  const _$CreditCardStateImpl(
      {this.animateCard = false,
      this.cardSide = CardSide.front,
      this.selectedField});

  @override
  @JsonKey()
  final bool animateCard;
  @override
  @JsonKey()
  final CardSide cardSide;
  @override
  final SelectedField? selectedField;

  @override
  String toString() {
    return 'CreditCardState(animateCard: $animateCard, cardSide: $cardSide, selectedField: $selectedField)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditCardStateImpl &&
            (identical(other.animateCard, animateCard) ||
                other.animateCard == animateCard) &&
            (identical(other.cardSide, cardSide) ||
                other.cardSide == cardSide) &&
            (identical(other.selectedField, selectedField) ||
                other.selectedField == selectedField));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, animateCard, cardSide, selectedField);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditCardStateImplCopyWith<_$CreditCardStateImpl> get copyWith =>
      __$$CreditCardStateImplCopyWithImpl<_$CreditCardStateImpl>(
          this, _$identity);
}

abstract class _CreditCardState implements CreditCardState {
  const factory _CreditCardState(
      {final bool animateCard,
      final CardSide cardSide,
      final SelectedField? selectedField}) = _$CreditCardStateImpl;

  @override
  bool get animateCard;
  @override
  CardSide get cardSide;
  @override
  SelectedField? get selectedField;
  @override
  @JsonKey(ignore: true)
  _$$CreditCardStateImplCopyWith<_$CreditCardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
