import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ptoyecto_ciclo4/models/datossitio.dart';
import 'package:ptoyecto_ciclo4/models/detalle_sitio_local.dart';
import 'package:ptoyecto_ciclo4/models/micardimage.dart';
import 'package:ptoyecto_ciclo4/repository/datos.dart';

class DetalleSitio extends StatefulWidget {
  final DatosSitio datosSitio;

  DetalleSitio(this.datosSitio);

  @override
  State<DetalleSitio> createState() => _DetalleSitioState();
}

class _DetalleSitioState extends State<DetalleSitio> {
  var favorito = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavoritos();
  }

  void getFavoritos() {
    final box = Datos.datFavoritos();
    box.values.forEach((element) {
      if (element.nombre == widget.datosSitio.nombre) {
        favorito = true;
      }
    });
  }

  void agregarFavoritos() {
    var sitiosFavorito = DetalleSitioLocal()
      ..ciudad = widget.datosSitio.ciudad
      ..departamento = widget.datosSitio.departamento
      ..temperatura = widget.datosSitio.temperatura
      ..descripcion = widget.datosSitio.descripcion
      ..foto = widget.datosSitio.foto
      ..calificacion = widget.datosSitio.calificacion
      ..nombre = widget.datosSitio.nombre;
    final box = Datos.datFavoritos();
    box.add(sitiosFavorito);
    if (favorito) {
      box.delete(sitiosFavorito.ciudad);
    } else {
      box.put(sitiosFavorito.ciudad, sitiosFavorito);
    }
    setState(() {
      favorito = !favorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromARGB(255, 143, 163, 207),
        backgroundColor: const Color.fromARGB(255, 188, 217, 240),
        appBar: AppBar(
          title: Text(widget.datosSitio.nombre),
          actions: [
            IconButton(
                padding: const EdgeInsets.only(right: 30),
                onPressed: () {
                  agregarFavoritos();
                },
                icon: Icon(
                  favorito ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                  size: 30,
                  color: Colors.yellow,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            miCardImage(widget.datosSitio.foto,
                '${'Ciudad: '}${widget.datosSitio.ciudad}\n${'Departamento: '}${widget.datosSitio.departamento}\n${'Temperatura: '}${widget.datosSitio.temperatura}\n\n${'Descripción: '}${widget.datosSitio.descripcion}\n\n${'Valoraciones de '}${widget.datosSitio.nombre}'),
            RatingBarIndicator(
              // initialRating: (widget.datosSitio.calificacion).toDouble(),
              // minRating: 1,
              rating: (widget.datosSitio.calificacion.toDouble()),

              direction: Axis.horizontal,
              // allowHalfRating: true,
              itemSize: 25,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Color.fromARGB(255, 209, 127, 27),
              ),
              //onRatingUpdate: null,
            ),
            Text(
              'Votos: ${widget.datosSitio.calificacion}',
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        )));
  }
}
