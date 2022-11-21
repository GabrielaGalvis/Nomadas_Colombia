import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nomadas_colombia/pages/detail_store_page.dart';

class LugarStorePage extends StatefulWidget {
  const LugarStorePage({super.key});

  @override
  State<LugarStorePage> createState() => _LugarStorePageState();
}

class _LugarStorePageState extends State<LugarStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Stores")
              .snapshots(), //carga la información
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return const Text("Loading"); //si no tiene datos snapshot
            return ListView.builder(
                //muestra una lista con los datos
                itemCount: snapshot
                    .data?.docs.length, //cantidad de datos que vamos a tener
                itemBuilder: (context, index) {
                  //el index es la posición del arreglo
                  QueryDocumentSnapshot store = snapshot
                      .data!.docs[index]; //nos permite acceder a los atributos
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ListTile(
                      title: Text(store['nombre'],
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        store['direccion'],
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      leading: Container(
                        height: 70.0,
                        width: 70.0,
                        child: Image.network(store['urlImagen']),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailStorePage(store)));
                      },
                    ),
                  );
                });
          }, //snapshot contiene la información que queremos visualizar
        ),
      ),
    );
  }
}
