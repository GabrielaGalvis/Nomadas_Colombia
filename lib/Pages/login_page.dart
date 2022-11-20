// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ptoyecto_ciclo4/Pages/menuinferior_page.dart';
import 'package:ptoyecto_ciclo4/Pages/registrar_page.dart';
import 'package:ptoyecto_ciclo4/repository/firebase_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  final FirebaseApi _firebaseApi = FirebaseApi();

  @override
  void initState() {
    super.initState();
  }

  void _validarUsuario() async {
    if (_email.text.isEmpty && _password.text.isEmpty) {
      _showMsg('Debe digitar el correo y la contraseña');
    } else {
      var result = await _firebaseApi.logInUser(_email.text, _password.text);
      String msg = '';
      if (result == 'user-not-found') {
        msg = 'Correo electrónico no registrado';
      } else if (result == 'wrong-password') {
        msg = 'Contraseña incorrecta';
      } else if (result == 'network-request-failed') {
        msg = 'Revise su conexión a internet';
      } else {
        msg = 'Bienvenido';
      }
      _showMsg(msg);
      if (msg == 'Bienvenido') {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MenuInferior()));
      }
    }
  }

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
                  controller: _email,
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
                  controller: _password,
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
                      _validarUsuario();
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
