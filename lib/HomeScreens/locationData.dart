//import 'dart:async';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
//
//
//class GoogleMapsDemo extends StatefulWidget {
//  @override
//  _GoogleMapsDemoState createState() => _GoogleMapsDemoState();
//}
//class _GoogleMapsDemoState extends State<GoogleMapsDemo> {
//
//  Completer<GoogleMapController> _controller = Completer();
//
//  GoogleMapController mapController;
//  Location location = Location();
//  Marker marker;
//  @override
//  void initState() {
//    super.initState();
//    location.onLocationChanged().listen((location) async {
//      if(marker != null) {
//        mapController.removeMarker(marker);
//      }
//      marker = await mapController?.addMarker(MarkerOptions(
//        position: LatLng(location["latitude"], location["longitude"]),
//      ));
//      mapController?.moveCamera(
//        CameraUpdate.newCameraPosition(
//          CameraPosition(
//            target: LatLng(
//              location["latitude"],
//              location["longitude"],
//            ),
//            zoom: 20.0,
//          ),a
//        ),
//      );
//    });
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        children: <Widget>[
//          Container(
//            height: MediaQuery.of(context).size.height,
//            width: MediaQuery.of(context).size.width,
//            child: GoogleMap(
//              onMapCreated: (GoogleMapController controller) {
//                mapController = controller;
//              },
//              options: GoogleMapOptions(
//                cameraPosition: CameraPosition(
//                  target: LatLng(37.4219999, -122.0862462),
//                ),
//                myLocationEnabled: true,
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}


import 'package:hackcovid/common_variables/app_functions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

//_getLocation() async
//{
//  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//  LATITUDE = position.latitude;
//  LONGITUDE = position.longitude;
//
//  final coordinates = new Coordinates(position.latitude, position.longitude);
//  var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//  var myLocation = addresses.first;
////  print("${first.featureName} : ${first.addressLine}");
//  LATITUDE = myLocation.latitude;
//  LONGITUDE = myLocation.longitude;
//  print('the current location ${LATITUDE}, ${LONGITUDE}');
//}

class MapUtils {

  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}


getUserLocation() async {
  print('the current location ${LATITUDE}, ${LONGITUDE}');

  LocationData myLocation;
  String error;
  Location location = new Location();
  try {
    myLocation = await location.getLocation();
  } on PlatformException catch (e) {
    if (e.code == 'PERMISSION_DENIED') {
      error = 'please grant permission';
      print(error);
    }
    if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
      error = 'permission denied- please enable it from app settings';
      print(error);
    }
    myLocation = null;
  }

  LATITUDE = myLocation.latitude;
  LONGITUDE = myLocation.longitude;
  print('the current location ${LATITUDE}, ${LONGITUDE}');
}