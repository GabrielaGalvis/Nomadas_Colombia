class Stores {
  var _id;
  var _nombre;
  var _horario;
  var _urlImagen;
  var _latitud;
  var _direccion;
  var _longitud;

  Stores();

  get id => _id;

  set id(value) {
    _id = value;
  }

  get nombre => _nombre;

  set nombre(value) {
    _nombre = value;
  }

  get horario => _horario;

  set horario(value) {
    _horario = value;
  }

  get urlImagen => _urlImagen;

  set urlImagen(value) {
    _urlImagen = value;
  }

  get latitud => _latitud;

  set latitud(value) {
    _latitud = value;
  }

  get longitud => _longitud;

  set longitud(value) {
    _longitud = value;
  }

  get direccion => _direccion;

  set direccion(value) {
    _direccion = value;
  }
}
