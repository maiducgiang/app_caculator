// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_topic.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentTopicAdapter extends TypeAdapter<CurrentTopic> {
  @override
  final int typeId = 5;

  @override
  CurrentTopic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentTopic(
      id: fields[0] as String?,
      currentTopic: fields[1] as TopicLocal?,
      listTopic: (fields[2] as List?)?.cast<TopicLocal>(),
      currentTheme: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CurrentTopic obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.currentTopic)
      ..writeByte(3)
      ..write(obj.currentTheme)
      ..writeByte(2)
      ..write(obj.listTopic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentTopicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
