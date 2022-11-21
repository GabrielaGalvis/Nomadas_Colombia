import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nomadas_colombia/boxes.dart';
import 'package:nomadas_colombia/modelo/local_lugares.dart';
import 'package:nomadas_colombia/modelo/lugares_modelo.dart';

class detallePage extends StatefulWidget {
  final Lugares datosLugares;

  detallePage(this.datosLugares);

  @override
  State<detallePage> createState() => _detallePageState();
}

class _detallePageState extends State<detallePage> {
  var isFavorite = false;

  @override
  void initState() {
    _getLocalLugar();
    super.initState();
  }

  void _getLocalLugar() async {
    //var aux = FirebaseFirestore.instance.collection("Lugares").doc();
    final box = Boxes.getLugaresFavoritos();
    box.values.forEach((element) {
      if (element.id == widget.datosLugares.id) {
        isFavorite = true;
      }
    });
  }

  _onFavoritesButtonClicked() async {
    //var aux = FirebaseFirestore.instance.collection("Lugares").doc();
    var localLugares = LocalLugares()
      ..id = widget.datosLugares.id
      ..ciudad = widget.datosLugares.ciudad
      ..departamento = widget.datosLugares.departamento
      ..temperatura = widget.datosLugares.temperatura
      ..descripcion = widget.datosLugares.descripcion
      ..foto = widget.datosLugares.foto
      ..nombre = widget.datosLugares.nombre
      ..puntuacion = widget.datosLugares.puntuacion;

    final box = Boxes.getLugaresFavoritos();
    //box.add(localLugares);
    if (isFavorite) {
      box.delete(localLugares.id);
    } else {
      box.put(localLugares.id, localLugares);
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles del sitios turistico"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.datosLugares.nombre,
                style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: double.infinity,
                child:
                    Image.network(widget.datosLugares.foto, fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.topRight,
                      onPressed: (() {
                        _onFavoritesButtonClicked();
                      }),
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 40,
                      ),
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
              Text(
                "Ciudad: ${widget.datosLugares.ciudad}\n\nDepartamento: ${widget.datosLugares.departamento}\n\nTemperatura: ${widget.datosLugares.temperatura}\n\nDescripción: ${widget.datosLugares.descripcion}\n\nPuntuación: ${widget.datosLugares.puntuacion}",
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
