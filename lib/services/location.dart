import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async {
    //LocationPermission permission = await Geolocator.checkPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      longitude = position.longitude;
      latitude = position.latitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
