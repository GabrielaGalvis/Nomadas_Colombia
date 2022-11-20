import 'package:ptoyecto_ciclo4/models/detalle_sitio_local.dart';
import 'package:hive/hive.dart';

class Datos {
  static Box<DetalleSitioLocal> datFavoritos() =>
      Hive.box<DetalleSitioLocal>('favoritos');
}
