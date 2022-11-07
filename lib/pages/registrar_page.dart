import 'package:flutter/material.dart';
import 'package:nomadas_colombia/modelo/usuario_modelo.dart';
import 'package:nomadas_colombia/pages/login_page.dart';
import 'package:nomadas_colombia/repositorio/usuario_registrar.dart';

class RegistrarPage extends StatefulWidget {
  const RegistrarPage({super.key});

  @override
  State<RegistrarPage> createState() => _RegistrarPageState();
}

enum Genero { Masculino, Femenino }

class _RegistrarPageState extends State<RegistrarPage> {
  final nombres = TextEditingController();
  final apellidos = TextEditingController();
  final email = TextEditingController();
  final telefono = TextEditingController();
  final password = TextEditingController();
  final password_conf = TextEditingController();
  Usuario_Registrar usuario = Usuario_Registrar();
  late mensaje msg;

  Genero? _genero = Genero.Femenino;

  void guardarUsuario(Usuario usuNew) async {
    var resultado = await usuario.registrarUsuario(email.text, password.text);

    if (resultado == 'invalid-email') {
      msg.mostrarMensaje("El formato del correo no es correcto.");
    } else if (resultado == 'weak-password') {
      msg.mostrarMensaje("La contraseña debe tener mínimo 6 caracteres.");
    } else if (resultado == 'unknown') {
      msg.mostrarMensaje("Complete los datos.");
    } else if (resultado == 'network-request-failed') {
      msg.mostrarMensaje("Revise la conexión a internet.");
    } else {
      msg.mostrarMensaje("Usuario registrado exitosamente, inicie sesión.");
      usuNew.id = resultado;
      registrarUsuario(usuNew);
    }
  }

  void registrarUsuario(Usuario usuNew) async {
    var id = await usuario.crearUsuario(usuNew);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void traerDatos() {
    setState(() {
      if (password.text == password_conf.text) {
        if (nombres.text.isNotEmpty &&
            apellidos.text.isNotEmpty &&
            email.text.isNotEmpty &&
            telefono.text.isNotEmpty &&
            password.text.isNotEmpty &&
            password_conf.text.isNotEmpty) {
          String gen = 'Femenino';
          if (_genero == Genero.Masculino) {
            gen = 'Masculino';
          }

          var usuNew = Usuario("", nombres.text, apellidos.text, email.text,
              telefono.text, gen, password.text);
          guardarUsuario(usuNew);
        } else {
          msg.mostrarMensaje("Datos incompletos");
        }
      } else {
        msg.mostrarMensaje("Las contraseñas no coinciden");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    msg = mensaje(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 40),
                    margin: const EdgeInsets.all(30),
                    child: const Image(
                        image: AssetImage("assets/Logo2.png"),
                        width: 120,
                        height: 120),
                  ),
                  TextFormField(
                    controller: nombres,
                    decoration: InputDecoration(
                        hintText: "Nombres",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: const Icon(
                          Icons.person,
                          color: Colors.lightBlue,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: apellidos,
                    decoration: InputDecoration(
                        hintText: "Apellidos",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: const Icon(
                          Icons.person,
                          color: Colors.lightBlue,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        hintText: "Correo electrónico",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: const Icon(
                          Icons.email,
                          color: Colors.lightBlue,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: telefono,
                    decoration: InputDecoration(
                        hintText: "Teléfono",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: const Icon(
                          Icons.phone,
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
                        suffixIcon: const Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.lightBlue,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: password_conf,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Repetir contraseña",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: const Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.lightBlue,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Género:",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  ListTile(
                    title: const Text(
                      'Femenino',
                      style: TextStyle(color: Colors.black54),
                    ),
                    leading: Radio<Genero>(
                      value: Genero.Femenino,
                      groupValue: _genero,
                      onChanged: (Genero? value) {
                        //se llamará cada vez que el usuario seleccione el botón de opción
                        setState(() {
                          //cambia el estado
                          _genero = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Masculino',
                      style: TextStyle(color: Colors.black54),
                    ),
                    leading: Radio<Genero>(
                      value: Genero.Masculino,
                      groupValue: _genero,
                      onChanged: (Genero? value) {
                        setState(() {
                          _genero = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(400, 50),
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          shadowColor: Colors.black26,
                          textStyle: const TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20)),
                      onPressed: () {
                        traerDatos();
                      },
                      child: const Text("Registrar"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
