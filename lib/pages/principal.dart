import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nomadas_colombia/modelo/sitio_modelo.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sitios turisticos"),
      ),
      /*body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hola: ${FirebaseAuth.instance.currentUser?.email}"),
          ],
        ),
      ),*/
      body: ListView.builder(
        itemCount: sitios.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: ListTile(
              title: Text(sitios[index].nombre,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(
                sitios[index].descripcion,
                style: const TextStyle(
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              leading: Container(
                height: 50.0,
                width: 50.0,
                child: Image.network(sitios[index].foto),
              ),
              trailing: Text(
                "${sitios[index].puntuacion}",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                sitio = sitios[index];
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SitePage()));
              },
            ),
          );
        },
      ),
    );
  }
}

Sitio sitio = Sitio("", "", "", 0.0);

class SitePage extends StatelessWidget {
  const SitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del sitios turistico"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(sitio.nombre,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: double.infinity,
                child: Image.network(sitio.foto, fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Ciudad: Cartagena de indias\n\nDepartamento: Bolivar\n\nTemperatura: 37 °C\n\nDescripción: ${sitio.descripcion}\n\nPuntuación: ${sitio.puntuacion}",
                style: const TextStyle(
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
