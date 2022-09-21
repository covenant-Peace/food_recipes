// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import 'constants.dart';
import 'controller/location_controller.dart';

class LocationSearchDialog extends StatelessWidget {
  // const LocationSearchDialog({Key? key}) : super(key: key);
  final GoogleMapController mapController;

  const LocationSearchDialog({@required this.mapController});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Container(
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.0),
          color: Colors.transparent,
          border: Border(
            top: BorderSide(
                color: Color(0xFF6A6A6A), width: 1, style: BorderStyle.solid),
            bottom: BorderSide(
                color: Color(0xFF6A6A6A), width: 1, style: BorderStyle.solid),
            left: BorderSide(
                color: Color(0xFF6A6A6A), width: 1, style: BorderStyle.solid),
            right: BorderSide(
                color: Color(0xFF6A6A6A), width: 1, style: BorderStyle.solid),
          )),
      child: ListTile(
        title: TypeAheadField(
          textFieldConfiguration: TextFieldConfiguration(
            decoration: InputDecoration(
              hintText: '13, Alfred Rewane , Lagos state',
              hintStyle: kTextJourney34,
              // errorText:
              //     validate == false ? 'Please, Enter your name' : null,
              border: InputBorder.none,
            ),
            obscureText: false,
            style: kTextJourney3,
            textInputAction: TextInputAction.search,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            keyboardType: TextInputType.streetAddress,
            controller: _controller,
          ),
          suggestionsCallback: (pattern) async {
            return await Get.find<LocationController>()
                .searchLocation(context, pattern);
          },
          itemBuilder: (context, Prediction suggestion) {
            return Expanded(
                child: Text(
              suggestion.description,
              maxLines: 1,
              style: kTextJourney34,
            ));
          },
        ),
      ),
    );
  }
}
