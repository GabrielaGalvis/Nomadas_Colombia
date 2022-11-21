import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ptoyecto_ciclo4/models/lugar.dart';

class DetailLugarPage extends StatefulWidget {
  var lugar;

  DetailLugarPage(this.lugar);

  @override
  State<DetailLugarPage> createState() => _DetailLugarPageState(lugar);
}

class _DetailLugarPageState extends State<DetailLugarPage> {
  var lugar;
  _DetailLugarPageState(this.lugar);

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set<Marker>();

  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lugar['nombre'])),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
              target: LatLng(lugar['latitud'], lugar['longitud']),
              zoom: 15,
            ),
            markers: _markers,
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
              // _controller.complete(controller);
              _showLugar();
            },
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 200,
            offset: 50,
          )
        ],
      ),
    );
  }

  void _showLugar() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(lugar['nombre']),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(
          lugar['latitud'],
          lugar['longitud'],
        ),
        // infoWindow: InfoWindow(
        //     title: lugar['nombre'], snippet: "Telefono: ${lugar['telefono']}"),
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(lugar['urlImagen']),
                          fit: BoxFit.fitWidth,
                          filterQuality: FilterQuality.high),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      color: Colors.blue,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Horario: ${lugar['horario']}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Direccion: ${lugar['direccion']}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Telefono: ${lugar['telefono']}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 10.0),
                    ),
                  ),
                ],
              ),
            ),
            LatLng(lugar['latitud'], lugar['longitud']),
          );
        },
      ));
    });
  }
}
