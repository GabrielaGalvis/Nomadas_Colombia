import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ptoyecto_ciclo4/models/datossitio.dart';
import 'package:ptoyecto_ciclo4/models/micardimage.dart';

class DetalleSitio extends StatefulWidget {
  final DatosSitio datosSitio;

  DetalleSitio(this.datosSitio);

  @override
  State<DetalleSitio> createState() => _DetalleSitioState();
}

class _DetalleSitioState extends State<DetalleSitio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromARGB(255, 143, 163, 207),
        backgroundColor: const Color.fromARGB(255, 188, 217, 240),
        appBar: AppBar(title: Text(widget.datosSitio.nombre)),
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
                color: Color.fromARGB(255, 255, 255, 6),
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
