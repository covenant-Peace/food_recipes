// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/controller/location_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_geocoder/location_geocoder.dart';

class Maps extends StatefulWidget {
  // const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
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
      zoom: 10,
    );
    return GetBuilder<LocationController>(
        // stream: null,
        builder: (locationController) {
      return Scaffold(
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
          Padding(
            padding: const EdgeInsets.only(top: 420),
            child: Container(
              height: 354,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 35, right: 35, top: 50, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter preferred Location',
                      style: kTextJourney4,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 56,
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
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                          latin();
                        },
                      child: Container(
                        height: 56.0,
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
          )
        ]),
      );
    });
  }

  double emire = 6.6278996;
  double longre = 3.3710233;

  void latin() async {
    final LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
    final address = await geocoder.findAddressesFromQuery(conti);
    setState(() {
      emire = address.first.coordinates.latitude;
      longre = address.first.coordinates.longitude;
    });

    print('$conti $emire $longre');
  }

  longin() async {
    final LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
    final address = await geocoder.findAddressesFromQuery(conti);
    longre = address.first.coordinates.longitude;
  }
}
