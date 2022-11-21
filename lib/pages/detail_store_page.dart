import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailStorePage extends StatefulWidget {
  var store;
  DetailStorePage(this.store);

  @override
  State<DetailStorePage> createState() => _DetailStorePageState(store);
}

class _DetailStorePageState extends State<DetailStorePage> {
  var store;
  _DetailStorePageState(this.store);
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = Set<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(store['nombre']),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            store['latitud'],
            store['longitud'],
          ),
          zoom: 15,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _showMarket();
        },
      ),
    );
  }

  void _showMarket() {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId(store['nombre']),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(store['latitud'], store['longitud']),
            infoWindow: InfoWindow(
              snippet: store['nombre'],
            )),
      );
    });
  }
}
