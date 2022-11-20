// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ptoyecto_ciclo4/Pages/login_page.dart';
import 'package:ptoyecto_ciclo4/models/user.dart';
import 'package:ptoyecto_ciclo4/repository/firebase_api.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({super.key});

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

class _RegistrarPageState extends State<RegistrarPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  void _showMsg(String msg) {
    final Scaffold = ScaffoldMessenger.of(context);
    Scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: Scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void mensajeOk(String msgOk) {
    final pantalla = ScaffoldMessenger.of(context);
    pantalla.showSnackBar(SnackBar(
      content: Text(
        msgOk,
        style: const TextStyle(fontSize: 16),
      ),
      backgroundColor: const Color(0xFF4CAF50),
      duration: const Duration(seconds: 5),
    ));
  }

  void saveUser(User user) async {
    var result = await _firebaseApi.registerUser(user.email, user.password);
    String msg = '';
    String msgOk = '';
    if (result == 'invalid-email') {
      msg = 'El Correo electrónico está mal escrito';
    } else if (result == 'weak-password') {
      msg = 'La contraseña debe tener minimo 6 digitos';
    } else if (result == 'email-already-in-use') {
      msg = 'Ya existe una cuenta con este correo electrónico';
    } else if (result == 'network-request-failed') {
      msg = 'Revise su conexión a internet';
    } else {
      msgOk = 'Usuario registrado con exito';
    }
    mensajeOk(msgOk);
  }

  void _onRegisterButtonClicked() {
    setState(() {
      if (_password.text == _repPassword.text) {
        var user = User(_email.text, _password.text);
        saveUser(user);
        mensajeOk('Usuario registrado con exito');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        _showMsg("Las contraseñas deben de ser iguales");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  controller: _email,
                  decoration: InputDecoration(
                      labelText: 'email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.lightBlue,
                      )),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      suffixIcon: Icon(
                        Icons.vpn_key_sharp,
                        color: Colors.lightBlue,
                      )),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _repPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Repetir Contraseña",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      suffixIcon: Icon(
                        Icons.vpn_key_sharp,
                        color: Colors.lightBlue,
                      )),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 30,
                ),
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
                      _onRegisterButtonClicked();
                    },
                    child: const Text("Registrar"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
