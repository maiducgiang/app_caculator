// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_click.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusClickAdapter extends TypeAdapter<StatusClick> {
  @override
  final int typeId = 6;

  @override
  StatusClick read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatusClick(
      id: fields[0] as String?,
      statusClick: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, StatusClick obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.statusClick);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusClickAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
