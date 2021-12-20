// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordAdapter extends TypeAdapter<Record> {
  @override
  final int typeId = 2;

  @override
  Record read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Record(
      amount: fields[1] as int,
      category: fields[0] as Category,
      date: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Record obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
