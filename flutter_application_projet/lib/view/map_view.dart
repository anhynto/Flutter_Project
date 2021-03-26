import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_projet/api/launchpad_manager.dart';
import 'package:flutter_application_projet/model/launchpad.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Set<Marker> _markers = {};

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.966428, -95.844032),
    zoom: 2,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Launchpad>>(
      future: LaunchpadManager().loadLaunchpads(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          snapshot.data.forEach(
            (launchpad) {
              _markers.add(
                Marker(
                  markerId: MarkerId(launchpad.id),
                  position: LatLng(launchpad.latitude, launchpad.longitude),
                  infoWindow: InfoWindow(
                      title: launchpad.fullName,
                      snippet: launchpad.name +
                          ' - ' +
                          launchpad.locality +
                          " - " +
                          launchpad.region),
                ),
              );
            },
          );
        }
        return new Scaffold(
          body: GoogleMap(
            mapType: MapType.normal,
            markers: _markers,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        );
      },
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
