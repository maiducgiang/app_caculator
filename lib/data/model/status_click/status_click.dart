import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:mubaha/data/cache_manager.dart';

part 'status_click.g.dart';

@HiveType(typeId: CacheManager.statusClick)
class StatusClick extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  bool statusClick;

  StatusClick({this.id, required this.statusClick});
}
