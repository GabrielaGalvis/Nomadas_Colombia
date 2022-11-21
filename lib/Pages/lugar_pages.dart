import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ptoyecto_ciclo4/Pages/detail_lugar_page.dart';

class LugarPage extends StatefulWidget {
  const LugarPage({super.key});

  @override
  State<LugarPage> createState() => _LugarPageState();
}

class _LugarPageState extends State<LugarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('lugar').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading');
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot lugar = snapshot.data!.docs[index];
                return Card(
                    color: const Color.fromARGB(255, 139, 176, 193),
                    child: ListTile(
                      leading: Image.network(
                        lugar['urlImagen'] ?? '',
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Image(
                            image: AssetImage(
                                'asset / Castillo - San - felipe.png'),
                          );
                        },
                      ),
                      title: Text(lugar['nombre']),
                      subtitle: Text(lugar['direccion']),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailLugarPage(lugar)));
                      },
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}
