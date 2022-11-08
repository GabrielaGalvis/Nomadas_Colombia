import 'package:flutter/material.dart';
import 'package:ptoyecto_ciclo4/Pages/site_page.dart';
import 'package:ptoyecto_ciclo4/models/sitio.dart';

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaPageState();
}

class _ListaPageState extends State<Lista> {
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
                      fontSize: 19,
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
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
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
