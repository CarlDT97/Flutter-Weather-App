import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Pair<double, double>?> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return null;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return Pair<double, double>(position.latitude, position.longitude);
  }
}

class Pair<T1, T2> {
  final T1 first;
  final T2 second;

  Pair(this.first, this.second);
}
