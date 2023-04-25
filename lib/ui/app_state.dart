import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mubaha/data/model/topic_local/topic_local.dart';
import 'package:mubaha/data/model/user/user_session.dart';

part 'app_state.freezed.dart';

@immutable
@freezed
class AppState with _$AppState {
  const factory AppState({TopicLocal? topicLocal, ThemeData? themeData}) =
      _AppState;
  factory AppState.initial() => const AppState();
}
