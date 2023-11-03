import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_g/LocationProvider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locationProvider.getUserLocation();
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Cuttent location'),
            ),
            body:
                // locationProvider.userLocation == null
                //     ? const Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     :
                GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                  target: LatLng(locationProvider.userLocation!.latitude,
                      locationProvider.userLocation!.longitude),
                  zoom: 14),
              markers: {
                Marker(
                    markerId: const MarkerId('user location'),
                    position: LatLng(
                      locationProvider.userLocation!.latitude,
                      locationProvider.userLocation!.longitude,
                    ),
                    infoWindow: const InfoWindow(title: 'your location')),
              },
            )));
  }
}
