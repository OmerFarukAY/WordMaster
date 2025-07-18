// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class personAdapter extends TypeAdapter<person> {
  @override
  final int typeId = 0;

  @override
  person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return person(
      id: fields[0] as int,
      username: fields[1] as String,
      password: fields[2] as String,
      role: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, person obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is personAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
