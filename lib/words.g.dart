// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'words.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class wordsAdapter extends TypeAdapter<words> {
  @override
  final int typeId = 1;

  @override
  words read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return words(
      turkish: fields[0] as String,
      english: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, words obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.turkish)
      ..writeByte(1)
      ..write(obj.english);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is wordsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
