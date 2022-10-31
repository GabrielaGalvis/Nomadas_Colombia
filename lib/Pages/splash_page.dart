// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:ptoyecto_ciclo4/Pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
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
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                child: Image(
                  image: AssetImage("assets/Logo2.png"),
                ),
              ),
              Column(
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Cargando...'),
                ],
              )
            ]),
      ),
    );
  }
}
