import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mubaha/data/cache_manager.dart';
import 'package:mubaha/data/model/topic_local/topic_local.dart';

part 'current_topic.g.dart';

@HiveType(typeId: CacheManager.currentTopic)
class CurrentTopic extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  TopicLocal? currentTopic;
  @HiveField(3)
  String? currentTheme;

  @HiveField(2)
  List<TopicLocal>? listTopic;

  CurrentTopic({this.id, this.currentTopic, this.listTopic, this.currentTheme});

  CurrentTopic copyWith(
      {String? id,
      TopicLocal? currentTopic,
      List<TopicLocal>? listTopic,
      String? currentTheme}) {
    return CurrentTopic(
        id: id ?? this.id,
        currentTheme: currentTheme ?? this.currentTheme,
        listTopic: listTopic ?? this.listTopic,
        currentTopic: currentTopic ?? this.currentTopic);
  }
}
