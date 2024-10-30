// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReposEntitiesAdapter extends TypeAdapter<ReposEntities> {
  @override
  final int typeId = 1;

  @override
  ReposEntities read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReposEntities(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReposEntities obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.full_name)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReposEntitiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
