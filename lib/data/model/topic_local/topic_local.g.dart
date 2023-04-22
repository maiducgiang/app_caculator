// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TopicLocalAdapter extends TypeAdapter<TopicLocal> {
  @override
  final int typeId = 4;

  @override
  TopicLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TopicLocal(
      id: fields[5] as String?,
      title: fields[0] as String,
      primaryColor: fields[1] as Color,
      backgroundColor: fields[2] as Color,
      textColor: fields[3] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, TopicLocal obj) {
    writer
      ..writeByte(5)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.primaryColor)
      ..writeByte(2)
      ..write(obj.backgroundColor)
      ..writeByte(3)
      ..write(obj.textColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopicLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
