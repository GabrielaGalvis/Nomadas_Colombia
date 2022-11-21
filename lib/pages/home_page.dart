import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadas_colombia/pages/favorites_page.dart';
import 'package:nomadas_colombia/pages/login_page.dart';
import 'package:nomadas_colombia/pages/lugar_store_page.dart';
import 'package:nomadas_colombia/pages/principal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = 0;
  late List<Widget> pages;

  @override
  void initState() {
    _loadPages();
    super.initState();
  }

  void _loadPages() {
    pages = [];
    pages.add(Principal());
    pages.add(FavoritesPage());
    pages.add(LugarStorePage());
  }

  void _onItemTappend(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sitios Turísticos"),
        backgroundColor: Colors.lightBlue,
        actions: [
          PopupMenuButton(
            onSelected: (Menu item) {
              setState(
                () {
                  if (item == Menu.logOut) {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  }
                },
              );
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem(
                  value: Menu.logOut, child: Text("Cerrar Sesión")),
            ],
          ),
        ],
      ),
      body: IndexedStack(
        index:
            currentPage, //muestra cual es el indice de la pagina que queremos mostrar
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.lightBlue,
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: (page) {
          //inidica cual es la pagina a la que debemos navegar
          _onItemTappend(page);
        }, //indica cual esta activa actualmente
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.earthAmericas,
                size: 20,
              ),
              label: 'Sitios Turísticos'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.heart,
                size: 20,
              ),
              label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.mapLocationDot,
                size: 20,
              ),
              label: 'Mapa'),
        ],
      ),
    );
  }
}
