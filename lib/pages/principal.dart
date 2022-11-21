import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nomadas_colombia/modelo/lugares_modelo.dart';
import 'package:nomadas_colombia/pages/detalle_page.dart';
import 'package:nomadas_colombia/pages/login_page.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalPageState();
}

enum Menu { logOut }

class _PrincipalPageState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Lugares")
              .snapshots(), //carga la información
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } //si no tiene datos snapshot
            return ListView.builder(
                //muestra una lista con los datos
                itemCount: snapshot
                    .data?.docs.length, //cantidad de datos que vamos a tener
                itemBuilder: (context, index) {
                  //el index es la posición del arreglo
                  QueryDocumentSnapshot lugar = snapshot
                      .data!.docs[index]; //nos permite acceder a los atributos
                  var aux =
                      FirebaseFirestore.instance.collection("Lugares").doc();
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ListTile(
                      title: Text(lugar['nombre'],
                          style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        lugar['descripcion'],
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Container(
                        height: 70.0,
                        width: 70.0,
                        child: Image.network(lugar['foto']),
                      ),
                      trailing: Text(
                        "${lugar['puntuacion']}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      onTap: () {
                        Lugares lugares = Lugares(
                            aux.id,
                            lugar['ciudad'],
                            lugar['Departamento'],
                            lugar['Temperatura'],
                            lugar['descripcion'],
                            lugar['foto'],
                            lugar['nombre'],
                            lugar['puntuacion']);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => detallePage(lugares)));
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
