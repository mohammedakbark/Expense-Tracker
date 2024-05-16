// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_expence_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddExpenceModelAdapter extends TypeAdapter<AddExpenceModel> {
  @override
  final int typeId = 1;

  @override
  AddExpenceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddExpenceModel(
      amount: fields[2] as double,
      category: fields[1] as String,
      date: fields[4] as String,
      description: fields[3] as String,
      id: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddExpenceModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddExpenceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
