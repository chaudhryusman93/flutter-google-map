import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  Position? _userPosition;
  Position? get userLocation => _userPosition;

  Future<void> getUserLocation() async {
    try {
      LocationPermission locationPermission;
      locationPermission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _userPosition = position;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
