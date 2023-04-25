import 'dart:typed_data';
import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:mubaha/data/cache_manager.dart';

part 'topic_local.g.dart';

@HiveType(typeId: CacheManager.topic)
class TopicLocal extends HiveObject {
  @HiveField(5)
  String? id;
  @HiveField(0)
  String textColor;
  @HiveField(1)
  Color buttonColor;
  @HiveField(2)
  Color buttonTextColor;
  @HiveField(3)
  Color backgroundColor;

  TopicLocal(
      {this.id,
      required this.backgroundColor,
      required this.textColor,
      required this.buttonColor,
      required this.buttonTextColor});
}
