import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Pair<double, double>?> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled, show a dialog or perform any desired action
      return null;
    }

    // Request permission to access the location
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      // The user has previously denied the permission permanently, take them to the settings
      return null;
    }

    if (permission == LocationPermission.denied) {
      // The user has denied the permission, request it
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // The user has denied the permission again, show a dialog or perform any desired action
        return null;
      }
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Do something with the position (e.g., store it, display it, etc.)
    return Pair<double, double>(position.latitude, position.longitude);
  }
}

class Pair<T1, T2> {
  final T1 first;
  final T2 second;

  Pair(this.first, this.second);
}
