import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class LoadinPage extends StatelessWidget {
  const LoadinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Viajeros",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Viajando por el mundo"),
        ),
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
