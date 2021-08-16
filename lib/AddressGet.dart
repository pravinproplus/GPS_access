import 'package:flutter_geocoder/geocoder.dart';

class AddressGet {
  String? myaddress;
  Future addressGet(double lat, long) async {
    try {
      final coordinates = new Coordinates(lat, long);
      List addr =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var ad = addr.first;
      myaddress = ad.addressLine;
    } catch (e) {
      print(e);
    }
  }
}
