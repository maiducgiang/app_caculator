import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/model/topic_local/current_topic.dart';
import 'package:mubaha/data/model/topic_local/topic_local.dart';
import 'package:mubaha/ui/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());
  final CacheManager _cacheManager = CacheManager.instance;
  void updateTopic(TopicLocal? topicLocal) {
    emit(state.copyWith(topicLocal: topicLocal));
  }

  void init() {}
  // Future<void> initTheme() async {
  //   if (await _cacheManager.getCurrnetTopicCached() == null) {
  //     _cacheManager.addCurrnetTopicToCached(
  //         CurrentTopic(currentTheme: ThemeData.light()));
  //     emit(state.copyWith());
  //   }
  // }

  Future<void> setTheme(ThemeData theme) async {
    emit(state.copyWith(themeData: theme ?? ThemeData.light()));
  }
}
