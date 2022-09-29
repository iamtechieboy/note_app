// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interesting_idea_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InterestingIdeaModelAdapter extends TypeAdapter<InterestingIdeaModel> {
  @override
  final int typeId = 1;

  @override
  InterestingIdeaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InterestingIdeaModel()
      .._noteType = fields[0] as String?
      .._title = fields[1] as String?
      .._noteBody = fields[2] as String?
      .._remindedTime = fields[3] as String?
      .._lastEditedTime = fields[4] as String?
      .._itemColor = fields[5] as num?
      .._labels = (fields[6] as List?)?.cast<String>()
      .._isFinished = fields[8] as bool?;
  }

  @override
  void write(BinaryWriter writer, InterestingIdeaModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj._noteType)
      ..writeByte(1)
      ..write(obj._title)
      ..writeByte(2)
      ..write(obj._noteBody)
      ..writeByte(3)
      ..write(obj._remindedTime)
      ..writeByte(4)
      ..write(obj._lastEditedTime)
      ..writeByte(5)
      ..write(obj._itemColor)
      ..writeByte(6)
      ..write(obj._labels)
      ..writeByte(8)
      ..write(obj._isFinished);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InterestingIdeaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
