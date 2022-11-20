import 'package:hive/hive.dart';

part 'detalle_sitio_local.g.dart';

@HiveType(typeId: 0)
class DetalleSitioLocal extends HiveObject {
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
  String? nombre;
  @HiveField(6)
  String? foto;
  @HiveField(7)
  int? calificacion;
}
