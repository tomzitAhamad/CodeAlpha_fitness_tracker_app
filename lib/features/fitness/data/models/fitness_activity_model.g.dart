// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitness_activity_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FitnessActivityModelAdapter extends TypeAdapter<FitnessActivityModel> {
  @override
  final int typeId = 0;

  @override
  FitnessActivityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FitnessActivityModel(
      id: fields[0] as String,
      title: fields[1] as String,
      calories: fields[2] as int,
      duration: fields[3] as int,
      date: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FitnessActivityModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.calories)
      ..writeByte(3)
      ..write(obj.duration)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FitnessActivityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
