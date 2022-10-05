// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../drawer.dart';
import 'modal_description.dart';

class Description extends StatelessWidget {
  final GlobalKey<ScaffoldState> _gkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _gkey,
      drawer: App(),
      backgroundColor: Color(0xFF222222),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'images/flower.png',
                  ),
                ),
                Align(
                  // alignment: Alignment.bottomCenter,
                  child: DraggableScrollableSheet(
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: ModalDescription(),
                      );
                    },
                    minChildSize: 0.5,
                    initialChildSize: 0.5,
                    maxChildSize: 0.93,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(33.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => _gkey.currentState?.openDrawer(),
                          child: SvgPicture.asset(
                            'images/looks.svg',
                            // height: 4,
                            // width: 4,
                          )),
                      Icon(
                        Icons.search,
                        color: Color(0xFF0C0C0C),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
