import 'package:hive/hive.dart';
import 'package:nomadas_colombia/modelo/local_lugares.dart';

class Boxes {
  static Box<LocalLugares> getLugaresFavoritos() =>
      Hive.box<LocalLugares>('favoritos');
}
