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
    return InterestingIdeaModel(
      noteType: fields[0] as String?,
      title: fields[1] as String?,
      noteBody: fields[2] as String?,
      remindedDay: fields[3] as String?,
      remindedTime: fields[4] as String?,
      lastEditedTime: fields[5] as String?,
      itemColor: fields[6] as int?,
      labels: (fields[7] as List?)?.cast<String>(),
      isFinished: fields[8] as bool?,
      isPinned: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, InterestingIdeaModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.noteType)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.noteBody)
      ..writeByte(3)
      ..write(obj.remindedDay)
      ..writeByte(4)
      ..write(obj.remindedTime)
      ..writeByte(5)
      ..write(obj.lastEditedTime)
      ..writeByte(6)
      ..write(obj.itemColor)
      ..writeByte(7)
      ..write(obj.labels)
      ..writeByte(8)
      ..write(obj.isFinished)
      ..writeByte(9)
      ..write(obj.isPinned);
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
