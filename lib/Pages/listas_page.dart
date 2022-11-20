import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ptoyecto_ciclo4/Pages/detalle_sitio_page.dart';
import 'package:ptoyecto_ciclo4/models/datossitio.dart';

class ListasPage extends StatefulWidget {
  const ListasPage({super.key});

  @override
  State<ListasPage> createState() => _ListasPageState();
}

class _ListasPageState extends State<ListasPage> {
  List sitios = [];
  List<dynamic> idDoc = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSitios();
  }

  Future getSitios() async {
    String id = "";
    QuerySnapshot sitio =
        await FirebaseFirestore.instance.collection('Sitios').get();
    setState(() {
      if (sitio.docs.isNotEmpty) {
        for (var list in sitio.docs) {
          id = list.id;
          idDoc.add(id);
          sitios.add(list.data());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de sitios turisticos'),
        ),
        body: ListView.builder(
            itemCount: sitios.length,
            itemBuilder: (BuildContext context, i) {
              return Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          sitios[i]['foto'],
                        ),
                        radius: 50,
                      )),
                  Expanded(
                    child: ListTile(
                        title: Text(sitios[i]['nombre'],
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        subtitle: Text(
                          sitios[i]['ciudad'],
                          style: GoogleFonts.roboto(
                              fontSize: 14, color: Colors.black),
                        ),
                        onTap: () {
                          DatosSitio sitiosNew = DatosSitio(
                              idDoc[i],
                              sitios[i]['ciudad'],
                              sitios[i]['departamento'],
                              sitios[i]['temperatura'],
                              sitios[i]['descripcion'],
                              sitios[i]['foto'],
                              sitios[i]['nombre'],
                              sitios[i]['calificacion']);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetalleSitio(sitiosNew)));
                        }),
                  ),
                ],
              );
            }));
  }
}
