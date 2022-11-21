import 'package:flutter/material.dart';
import 'package:nomadas_colombia/pages/home_page.dart';
import 'package:nomadas_colombia/pages/registrar_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  late mensaje msg;

  void validarUsuario() async {
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      if (user != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
      /*if (email.text == "nomadascolombia@gmail.com") {
      if (password.text == "nomadas1234") {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Principal()));
      } else {
        mostrarMensaje("Contraseña Incorrecta");
      }
    } else {
      mostrarMensaje('Usuario no registrado');
    }*/
    } on FirebaseAuthException catch (e) {
      //mostrarMensaje("$e.code");
      switch (e.code) {
        case 'invalid-email':
          msg.mostrarMensaje("El formato del correo no es correcto.");
          break;
        case 'user-not-found':
          msg.mostrarMensaje("El usuario no esta registrado.");
          break;
        case 'wrong-password':
          msg.mostrarMensaje("Contraseña incorrecta.");
          break;
        case 'unknown':
          msg.mostrarMensaje("Complete los datos.");
          break;
        case 'network-request-failed':
          msg.mostrarMensaje("Revise la conexión a internet.");
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    msg = mensaje(context);
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
                      hintText: "Correo electrónico",
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

class mensaje {
  late BuildContext context;
  mensaje(this.context);
  void mostrarMensaje(String mensaje) {
    final pantalla = ScaffoldMessenger.of(context);
    pantalla.showSnackBar(
      SnackBar(
        content: Text(
          mensaje,
          style: const TextStyle(fontSize: 20),
        ),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Aceptar',
          onPressed: pantalla.hideCurrentSnackBar,
        ),
      ),
    );
  }
}
