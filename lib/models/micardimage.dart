import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class miCardImage extends StatelessWidget {
  final String url;
  final String texto;

  miCardImage(this.url, this.texto);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      //margin: EdgeInsets.symmetric(horizontal: 50),
      // elevation: 10,
      color: const Color.fromARGB(255, 188, 217, 240),
      //fooColor.fromARGB(255, 188, 217, 240))
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            Image.network(
              url,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              height: 230,
            ),
            Container(
              // alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              color: const Color.fromARGB(255, 188, 217, 240),
              child: Text(
                texto,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
