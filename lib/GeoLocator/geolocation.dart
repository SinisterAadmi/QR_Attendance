import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  // Check the current permission status
  LocationPermission permission = await Geolocator.checkPermission();

  // If permission is denied, request it
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    // Check if the permission is granted after the request
    if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
      throw Exception('Location permissions are denied');
    }
  }

  // If permission is permanently denied, show an error message
  if (permission == LocationPermission.deniedForever) {
    throw Exception('Location permissions are permanently denied. Please enable them in settings.');
  }

  // If permission is granted, get the current position
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}
