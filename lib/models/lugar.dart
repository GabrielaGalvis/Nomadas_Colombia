class Lugar {
  var _id;
  var _nombre;
  var _telefono;
  var _horario;
  var _urlImagen;
  var _latitud;
  var _longitud;
  var _direccion;

  Lugar();

  get id => _id;

  set id(value) {
    _id = value;
  }

  get direccion => _direccion;

  set direccion(value) {
    _direccion = value;
  }

  get longitud => _longitud;

  set longitud(value) {
    _longitud = value;
  }

  get latitud => _latitud;

  set latitud(value) {
    _latitud = value;
  }

  get urlImagen => _urlImagen;

  set urlImagen(value) {
    _urlImagen = value;
  }

  get horario => _horario;

  set horario(value) {
    _horario = value;
  }

  get telefono => _telefono;

  set telefono(value) {
    _telefono = value;
  }

  get nombre => _nombre;

  set nombre(value) {
    _nombre = value;
  }


}
