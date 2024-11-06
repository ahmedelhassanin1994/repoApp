// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commits_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommitsEntitiesAdapter extends TypeAdapter<CommitsEntities> {
  @override
  final int typeId = 2;

  @override
  CommitsEntities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommitsEntities(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CommitsEntities obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.sha)
      ..writeByte(1)
      ..write(obj.nodeId)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.msg)
      ..writeByte(4)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommitsEntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
