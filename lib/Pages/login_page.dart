// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ptoyecto_ciclo4/Pages/principal.dart';
import 'package:ptoyecto_ciclo4/Pages/registrar_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final TextEditingController _required = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromARGB(255, 188, 217, 240),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: const Image(
                      image: AssetImage("assets/Logo2.png"),
                      width: 120,
                      height: 120),
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  margin: const EdgeInsets.all(30),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Correo elctronico",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      suffixIcon: Icon(Icons.email)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _required,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      suffixIcon: Icon(Icons.vpn_key_sharp)),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                        )),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrarPage()));
                    },
                    child: const Text("Registrarse")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Principal()));
                    },
                    child: const Text("Ingresar")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
