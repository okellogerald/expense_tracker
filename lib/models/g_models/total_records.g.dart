// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../total_records.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TotalRecordsAdapter extends TypeAdapter<TotalRecords> {
  @override
  final int typeId = 3;

  @override
  TotalRecords read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TotalRecords(
      budget: fields[2] as double,
      totalExpenses: fields[0] as double,
      totalIncome: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TotalRecords obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.totalExpenses)
      ..writeByte(1)
      ..write(obj.totalIncome)
      ..writeByte(2)
      ..write(obj.budget);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TotalRecordsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
