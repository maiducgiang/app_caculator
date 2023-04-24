import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_money_state.freezed.dart';

@freezed
class ChangeMoneyState with _$ChangeMoneyState {
  const factory ChangeMoneyState({
    bool? isLoading,
    required String error,
  }) = _ChangeMoneyState;
  factory ChangeMoneyState.initial() =>
      const ChangeMoneyState(isLoading: false, error: "");
}
