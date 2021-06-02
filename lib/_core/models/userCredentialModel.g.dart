// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userCredentialModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsercredentialmodelAdapter extends TypeAdapter<Usercredentialmodel> {
  @override
  final int typeId = 0;

  @override
  Usercredentialmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Usercredentialmodel(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Usercredentialmodel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.providerId)
      ..writeByte(1)
      ..write(obj.signInMethod)
      ..writeByte(2)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsercredentialmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
