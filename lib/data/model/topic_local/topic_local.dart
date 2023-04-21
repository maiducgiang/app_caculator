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
  String title;
  @HiveField(1)
  Color primaryColor;
  @HiveField(2)
  Color backgroundColor;
  @HiveField(3)
  Color textColor;

  TopicLocal(
      {this.id,
      required this.title,
      required this.primaryColor,
      required this.backgroundColor,
      required this.textColor});
}
