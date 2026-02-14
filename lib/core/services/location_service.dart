import 'package:geolocator/geolocator.dart';
import 'package:ballot_eye/core/error/failures.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationFailure('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const LocationFailure('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw const LocationFailure('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }
}
