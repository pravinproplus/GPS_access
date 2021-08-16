import 'package:geolocator/geolocator.dart';

class LocationGet {
  Position? position;
  double? latitude;
  double? longtitude;
  Future<void> getLocation() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position!.latitude;
      longtitude = position!.longitude;
    } catch (e) {
      print(e);
    }
  }
}
