import 'package:hive/hive.dart';
part 'local_lugares.g.dart';

@HiveType(typeId: 0) //se le pone cero por ser el primer modelo
class LocalLugares extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? ciudad;

  @HiveField(2)
  String? departamento;

  @HiveField(3)
  String? temperatura;

  @HiveField(4)
  String? descripcion;

  @HiveField(5)
  String? foto;

  @HiveField(6)
  String? nombre;

  @HiveField(7)
  String? puntuacion;
}
