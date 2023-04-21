import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/topic_local/topic_local.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState(
      {required bool isLoading, String? error, TopicLocal? topic}) = _MainState;

  factory MainState.initial({
    String? id,
  }) =>
      MainState(
        isLoading: false,
      );
}
