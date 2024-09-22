// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginStatusAdapter extends TypeAdapter<LoginStatus> {
  @override
  final int typeId = 1;

  @override
  LoginStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginStatus(
      fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LoginStatus obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isLogin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
