// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:food_recipes/model/food.dart';
import '../drawer.dart';
import 'modal_description.dart';

class Description extends StatelessWidget {
  final Food exampple;

  Description(this.exampple);

  final GlobalKey<ScaffoldState> _gkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _gkey,
      drawer: App(),
      backgroundColor: Color(0xFF222222),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                      child: Image.network(
                        exampple.image,
                      ),
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),
                  Align(
                    child: DraggableScrollableSheet(
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                          controller: scrollController,
                          child: ModalDescription(exampple),
                        );
                      },
                      minChildSize: 0.64,
                      initialChildSize: 0.65,
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
                            ),
                        ),
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
      ),
    );
  }
}
