// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  // const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: sourceLocation, zoom: 10)
          ),
          Padding(
            padding: const EdgeInsets.only(top: 478),
            child: Container(
              height: 354,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 35, right: 35, top: 50, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter preferred Location', style: kTextJourney4,),
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
                          onChanged: (val){
                            // name=val;
                          },
                          inputFormatters: [
                            // LengthLimitingTextInputFormatter(11),
                            // FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ]),
    );
  }
}
