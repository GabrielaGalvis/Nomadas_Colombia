// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ptoyecto_ciclo4/Pages/principal.dart';
import 'package:ptoyecto_ciclo4/Pages/registrar_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  void validarUsuario() {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      if (email.text == "nomadacolombia@gmail.com") {
        if (password.text == "nomada1234") {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const Principal()));
        } else {
          mostrarMensaje("Contraseña Incorrecta");
        }
      } else {
        mostrarMensaje('Usuario no registrado');
      }
    } else {
      mostrarMensaje('Datos Obligatorios');
    }
  }

  void mostrarMensaje(String mensaje) {
    final pantalla = ScaffoldMessenger.of(context);
    pantalla.showSnackBar(SnackBar(
      content: Text(
        mensaje,
        style: TextStyle(fontSize: 18),
      ),
      backgroundColor: Color.fromARGB(255, 190, 76, 68),
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Aceptar',
        textColor: Colors.white,
        onPressed: pantalla.hideCurrentSnackBar,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
                  controller: email,
                  decoration: InputDecoration(
                      hintText: "Correo elctronico",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.lightBlue,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    suffixIcon: Icon(
                      Icons.vpn_key_sharp,
                      color: Colors.lightBlue,
                    ),
                  ),
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
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(400, 50),
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        shadowColor: Colors.black26,
                        textStyle: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 20)),
                    onPressed: () {
                      validarUsuario();
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
