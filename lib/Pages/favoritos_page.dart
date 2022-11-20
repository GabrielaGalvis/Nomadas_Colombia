import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ptoyecto_ciclo4/Pages/detalle_sitio_page.dart';
import 'package:ptoyecto_ciclo4/models/datossitio.dart';
import 'package:ptoyecto_ciclo4/models/detalle_sitio_local.dart';
import 'package:ptoyecto_ciclo4/repository/datos.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key});

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListaFavoritos(),
      ),
    );
  }

  Widget ListaFavoritos() {
    return ValueListenableBuilder<Box<DetalleSitioLocal>>(
        valueListenable: Datos.datFavoritos().listenable(),
        builder: (context, box, _) {
          final lista = box.values.toList().cast<DetalleSitioLocal>();
          return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (BuildContext context, i) {
                return Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(lista[i].foto ?? ""),
                          radius: 50,
                        )),
                    Expanded(
                      child: ListTile(
                        title: Text(lista[i].nombre ?? "",
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        subtitle: Text(
                          lista[i].ciudad ?? "",
                          style: GoogleFonts.roboto(
                              fontSize: 14, color: Colors.black),
                        ),
                        onTap: () {
                          DatosSitio sitiosNew = DatosSitio(
                              lista[i].id ?? '',
                              lista[i].ciudad ?? '',
                              lista[i].departamento ?? '',
                              lista[i].temperatura ?? '',
                              lista[i].descripcion ?? '',
                              lista[i].foto ?? '',
                              lista[i].nombre ?? '',
                              lista[i].calificacion ?? 0);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetalleSitio(sitiosNew)));
                        },
                        onLongPress: () {
                          setState(() {
                            lista[i].delete();
                          });
                        },
                      ),
                    ),
                  ],
                );
              });
        });
  }
}
