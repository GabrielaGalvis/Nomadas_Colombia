import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ptoyecto_ciclo4/Pages/lugar_pages.dart';
import 'package:ptoyecto_ciclo4/Pages/listas_page.dart';

import 'favoritos_page.dart';

class MenuInferior extends StatefulWidget {
  const MenuInferior({super.key});

  @override
  State<MenuInferior> createState() => _MenuInferiorState();
}

class _MenuInferiorState extends State<MenuInferior> {
  var paginaActual = 0;

  late List<Widget> paginas;

  @override
  void initState() {
    // TODO: implement initState
    _loadPages();
    super.initState();
  }

  void _loadPages() {
    paginas = [];
    paginas.add(ListasPage());
    paginas.add(FavoritosPage());
    paginas.add(LugarPage());
  }

  void _onItemTapped(int paginas) {
    setState(() {
      paginaActual = paginas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: paginaActual,
        children: paginas,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaActual,
        onTap: (paginas) {
          _onItemTapped(paginas);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.umbrellaBeach, size: 20),
              label: 'Lista de Sitios'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.star, size: 20), label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.locationDot, size: 20),
              label: 'Ubicación'),
        ],
        backgroundColor: Colors.lightBlue,
        selectedItemColor: const Color.fromARGB(255, 2, 50, 89),
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
