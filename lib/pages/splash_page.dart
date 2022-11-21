import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nomadas_colombia/pages/home_page.dart';
import 'package:nomadas_colombia/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _closeSplash();
    super.initState();
  }

  Future<void> _closeSplash() async {
    Future.delayed(Duration(seconds: 2), () async {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
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
