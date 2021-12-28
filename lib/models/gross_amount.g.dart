// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gross_amount.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GrossAmountAdapter extends TypeAdapter<GrossAmount> {
  @override
  final int typeId = 5;

  @override
  GrossAmount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GrossAmount(
      id: fields[0] as String,
      amount: fields[1] as double,
      lastDate: fields[2] as DateTime,
      title: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GrossAmount obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.lastDate)
      ..writeByte(3)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrossAmountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
