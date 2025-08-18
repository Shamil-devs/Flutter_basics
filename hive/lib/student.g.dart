// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class studentAdapter extends TypeAdapter<student> {
  @override
  final int typeId = 1;

  @override
  student read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return student(
      name: fields[0] as String,
      rollno: fields[1] as int,
      subject: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, student obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.rollno)
      ..writeByte(2)
      ..write(obj.subject);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is studentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
