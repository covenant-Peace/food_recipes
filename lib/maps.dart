// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/controller/location_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_geocoder/location_geocoder.dart';

double emire = 6.6278996;
double longre = 3.3710233;

class Maps extends StatefulWidget {
  // const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  GoogleMap? mMap;
  // GoogleMapController controller;
  Marker? mMarker;

  // void moveCameraToUserLocation(searchedLocation2) async {
  //   // var location = await Geocode().getLatLng(searchedLocation2);
  //   // print("moving to: $location");
  //   controller.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: LatLng(emire, longre),
  //         zoom: 10,
  //       ),
  //     ),
  //   );
  // }
  // mMap.animateCamera();
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  final locationController = Get.put(LocationController());

  String conti;
  static const _apiKey = 'AIzaSyDz-FceM_J5lDltH3ajwSHVDSVzt3Sm-xI';

  @override
  Widget build(BuildContext context) {
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(emire, longre),
      zoom: 9,
    );

    double getH(double i) {
      return (i / 926) * MediaQuery.of(context).size.height;
    }

    double getW(double j) {
      return (j / 428) * MediaQuery.of(context).size.width;
    }


    return GetBuilder<LocationController>(
        // stream: null,
        builder: (locationController) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.white70,
          automaticallyImplyLeading: false,
          title: Text(
            'Enter Address',
            style: kTextJourney33,
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Stack(children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: {
              Marker(
                  markerId: MarkerId('_kGooglePlex'),
                  position: _kGooglePlex.target,
                  icon: BitmapDescriptor.defaultMarker)
            },
          ),
          DraggableScrollableSheet(
            // stream: null,
            builder: (context, snapshot) {
              return SingleChildScrollView(
                controller: snapshot,
                child: Padding(
                  padding: EdgeInsets.only(top: getH(420)),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getW(35), right: getW(35), top: getH(50), bottom: getH(50)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter preferred Location',
                            style: kTextJourney4,
                          ),
                          SizedBox(
                            height: getH(20),
                          ),
                          Container(
                            height: getH(56),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11.0),
                                color: Colors.transparent,
                                border: Border(
                                  top: BorderSide(
                                      color: Color(0xFF6A6A6A),
                                      width: 1,
                                      style: BorderStyle.solid),
                                  bottom: BorderSide(
                                      color: Color(0xFF6A6A6A),
                                      width: 1,
                                      style: BorderStyle.solid),
                                  left: BorderSide(
                                      color: Color(0xFF6A6A6A),
                                      width: 1,
                                      style: BorderStyle.solid),
                                  right: BorderSide(
                                      color: Color(0xFF6A6A6A),
                                      width: 1,
                                      style: BorderStyle.solid),
                                )),
                            child: ListTile(
                              title: TextField(
                                decoration: InputDecoration(
                                  hintText: '13, Alfred Rewane , Lagos state',
                                  hintStyle: kTextJourney34,
                                  // errorText:
                                  //     validate == false ? 'Please, Enter your name' : null,
                                  border: InputBorder.none,
                                ),
                                obscureText: false,
                                style: kTextJourney3,
                                keyboardType: TextInputType.text,
                                // controller: text,
                                onChanged: (val) {
                                  conti = val;
                                },
                                inputFormatters: [
                                  // LengthLimitingTextInputFormatter(11),
                                  // FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getH(30),
                          ),
                          GestureDetector(
                            onTap: () {
                              latin();
                              // _controller.animateCamera(
                              //     CameraUpdate.newCameraPosition(
                              //       CameraPosition(
                              //         target: LatLng(emire, longre),
                              //         zoom: 10,
                              //       ),
                              //     ));
                              //     setState(() {
                              //       allM
                              //     });
                            },
                            child: Container(
                              height: getH(56),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(48.0),
                                color: Color(0xFFEDA92E),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Confirm Address',
                                style: kTextJourney4,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            minChildSize: 0.94,
            initialChildSize: 0.95,
            maxChildSize: 1,
          )
        ]),
      );
    });
  }

  void latin() async {
    final LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
    final address = await geocoder.findAddressesFromQuery(conti);
    setState(() {
      emire = address.first.coordinates.latitude!;
      longre = address.first.coordinates.longitude!;
      // _controller..moveCamera(CameraUpdate.newLatLng(LatLng(emire, longre)));
    });

    // print('$conti $emire $longre');
  }

  longin() async {
    final LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
    final address = await geocoder.findAddressesFromQuery(conti);
    longre = address.first.coordinates.longitude!;
  }
}

