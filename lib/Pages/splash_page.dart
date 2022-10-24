// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:ptoyecto_ciclo4/Pages/loading.dart';
import 'package:ptoyecto_ciclo4/Pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    timeNext();
    super.initState();
  }

  Future<void> timeNext() async {
    Future.delayed(const Duration(seconds: 5), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 217, 240),
      body: Center(
        child: Container(
          child: const Image(
              image: AssetImage("assets/Logo2.png"), width: 300, height: 300),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          margin: const EdgeInsets.all(30),
        ),
      ),
    );
  }
}
