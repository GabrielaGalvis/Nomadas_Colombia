import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nomadas_colombia/boxes.dart';
import 'package:nomadas_colombia/modelo/local_lugares.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ValueListenableBuilder<Box<LocalLugares>>(
      valueListenable: Boxes.getLugaresFavoritos().listenable(),
      builder: (context, box, _) {
        final lugarBox = box.values.toList().cast<LocalLugares>();
        return ListView.builder(
          itemCount: lugarBox.length,
          itemBuilder: (BuildContext context, int index) {
            final lugar = lugarBox[index];
            return Card(
              //padding: const EdgeInsets.symmetric(vertical: 15),
              color: Colors.lightBlue.shade50,
              child: ListTile(
                leading: Container(
                  height: 70.0,
                  width: 70.0,
                  child: Image.network(
                    lugar.foto ?? "https://via.placeholder.com/250",
                  ),
                ),
                title: Text(
                  lugar.nombre ?? "No title",
                  style: const TextStyle(
                      //fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  lugar.puntuacion ?? "No hay puntuación",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                onLongPress: () {
                  setState(() {
                    lugar.delete();
                  });
                },
              ),
            );
          },
        );
      },
    );
  }
}
