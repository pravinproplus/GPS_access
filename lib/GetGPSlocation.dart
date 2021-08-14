import 'package:first_app/Networking/NetworkHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

import 'package:geolocator/geolocator.dart';

const apiKey = "99d92cc95a2292104c6595069ad89ce4";

class GetGPSlocation extends StatefulWidget {
  const GetGPSlocation({Key? key}) : super(key: key);

  @override
  _GetGPSlocationState createState() => _GetGPSlocationState();
}

class _GetGPSlocationState extends State<GetGPSlocation> {
  Position? position;
  String? myaddress;
  double? latitude;
  double? longtitude;
  // @override
  // void initState() {
  //   getLocation();
  //   super.initState();
  // }

  Future getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = position!.latitude;
      longtitude = position!.longitude;
    });
    addressGet(latitude!, longtitude!);

    // NetworkHelper networkHelper = NetworkHelper(
    //     'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longtitude&appid=$apiKey');
    // var weatherdata = await networkHelper.getData();
    // print(weatherdata);
  }

  Future addressGet(double lat, long) async {
    final coordinates = new Coordinates(lat, long);
    List addr = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      var ad = addr.first;
      myaddress = ad.addressLine;
    });
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          child: Column(
            children: [
              Center(
                child: Text(
                  position != null ? "$position" : "allow location access",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Divider(
                height: 20.0,
              ),
              Text(
                "Address:",
                style: TextStyle(color: Colors.green, fontSize: 20.0),
              ),
              Text(myaddress != null ? "$myaddress" : "wait")
            ],
          ),
        ),
      ),
    );
  }
}
