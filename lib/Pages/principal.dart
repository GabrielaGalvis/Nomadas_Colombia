// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PtincipalState();
}

class _PtincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    const ciudad = "Ciudad :   Cartagena"
        '\n'
        "Departamento:   Bolívar"
        '\n'
        'Temperatura:   37°'
        '\n'
        'Descripción:   Castillo de San Felipe de Barajas.'
        '\n'
        'El Castillo de San Felipe es uno de los principales atractivos turísticos de la ciudad de Cartagena, '
        'del cual no te puedes perder la experiencia de subir. '
        'El Castillo, que más bien es una fortificación, es considerado como Patrimonio de la Humanidad y una de las'
        'siete maravillas de Colombia porque su construcción es representativa de la identidad de Cartagena, '
        'el Castillo es símbolo de la historia que la ciudad ha vivido todos estos años.'
        '\n'
        '\n'
        '\n'
        '\n'
        'Otra innformación de interes';

    return Scaffold(
      appBar: AppBar(title: const Text("Detalle Sitio Turistico POI")),
      backgroundColor: const Color.fromARGB(255, 188, 217, 240),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: const Image(
                      image: AssetImage("assets/castillos.jpg"),
                      width: 300,
                      height: 200),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  margin: const EdgeInsets.all(30),
                ),
                const Text(ciudad,
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
