import 'package:first_app/AddressGet.dart';
import 'package:first_app/Location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GetGPSlocation extends StatefulWidget {
  const GetGPSlocation({Key? key}) : super(key: key);

  @override
  _GetGPSlocationState createState() => _GetGPSlocationState();
}

class _GetGPSlocationState extends State<GetGPSlocation> {
  Position? position;
  String? address;
  double? lat;
  double? long;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    LocationGet location = LocationGet();
    await location.getLocation();
    setState(() {
      lat = location.latitude;
      long = location.longtitude;
      print(lat);
      print(long);
    });

    getaddressData();
  }

  Future getaddressData() async {
    AddressGet addressGet = AddressGet();
    await addressGet.addressGet(lat!, long!);
    setState(() {
      address = addressGet.myaddress;
      print(address);
    });
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          child: Column(
            children: [
              Text(
                "Latitude:",
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
              Text(
                lat != null ? "$lat" : "allow location access",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "Longtude:",
                style: TextStyle(color: Colors.blue, fontSize: 18),
              ),
              Text(
                long != null ? "$long" : "allow location access",
                style: TextStyle(color: Colors.black),
              ),
              Divider(
                height: 20.0,
              ),
              Text(
                "Address:",
                style: TextStyle(color: Colors.green, fontSize: 20.0),
              ),
              Text(address != null ? "$address" : "wait")
            ],
          ),
        ),
      ),
    );
  }
}
