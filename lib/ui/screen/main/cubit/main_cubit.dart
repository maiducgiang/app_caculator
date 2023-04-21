import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/model/topic_local/topic_local.dart';
import 'package:mubaha/ui/screen/main/cubit/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.initial());
  final CacheManager _cacheManager = CacheManager.instance;
  void init() async {
    _cacheManager.addTopic(TopicLocal(
        title: "Dark mode",
        primaryColor: const Color(0xffFF6B6B),
        backgroundColor: const Color(0xff22252D),
        textColor: Colors.white));
    final topic = await _cacheManager.getTopic();
    emit(state.copyWith(topic: topic));
  }
}
