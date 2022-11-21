// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_lugares.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalLugaresAdapter extends TypeAdapter<LocalLugares> {
  @override
  final int typeId = 0;

  @override
  LocalLugares read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalLugares()
      ..id = fields[0] as String?
      ..ciudad = fields[1] as String?
      ..departamento = fields[2] as String?
      ..temperatura = fields[3] as String?
      ..descripcion = fields[4] as String?
      ..foto = fields[5] as String?
      ..nombre = fields[6] as String?
      ..puntuacion = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, LocalLugares obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ciudad)
      ..writeByte(2)
      ..write(obj.departamento)
      ..writeByte(3)
      ..write(obj.temperatura)
      ..writeByte(4)
      ..write(obj.descripcion)
      ..writeByte(5)
      ..write(obj.foto)
      ..writeByte(6)
      ..write(obj.nombre)
      ..writeByte(7)
      ..write(obj.puntuacion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalLugaresAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
