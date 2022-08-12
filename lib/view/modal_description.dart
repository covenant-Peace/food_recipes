// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_recipes/constants.dart';

class ModalDescription extends StatefulWidget {
  @override
  State<ModalDescription> createState() => _ModalDescriptionState();
}

class _ModalDescriptionState extends State<ModalDescription> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _removeCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.5,
      width: 428.0,
      decoration: BoxDecoration(
        color: Color(0xFF222222),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(62.0),
          topRight: Radius.circular(62.0),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 40.0, right: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 18.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 120.0),
              height: 2.0,
              width: 40.0,
              child: Divider(
                color: Color(0xFFE5E5E5),
                thickness: 2.0,
              ),
            ),
            SizedBox(
              height: 46.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mediterranean',
                  style: kTextJourney20,
                ),
                Icon(
                  Icons.panorama_fisheye,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'Salad',
              style: kTextJourney18,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Fresh and healthy salad made with our \nown chef Recipe. Special healthy and-fat \nfree dish for those who want to lose weight',
              style: kTextGet,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text(
                  'Quantity',
                  style: kTextGet,
                ),
                SizedBox(
                  width: 6.0,
                ),
                Container(
                  height: 23.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 6.0, top: 4.0, right: 6.0, bottom: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _removeCounter();
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 10.0,
                          ),
                        ),
                        Text('$_counter'),
                        GestureDetector(
                          onTap: () {
                            _incrementCounter();
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 9.0,
                ),
                Text(
                  'plate',
                  style: kTextGet,
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Text(
                  'Delivery Time',
                  style: kTextGet,
                ),
                SizedBox(
                  width: 18.0,
                ),
                Icon(
                  Icons.watch_later_outlined,
                  color: Color(0xFFE5E5E5),
                ),
                SizedBox(
                  width: 13.0,
                ),
                Text(
                  '25 Mins',
                  style: kTextGet,
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Total Price',
                    style: kTextGet,
                  ),
                  Text(
                    'NGN800.00',
                    style: kTextJourney10,
                  ),
                ]),
                GestureDetector(
                  onTap: () {
                    // controller.cardAdd(history)
                    // Get.to(PaymentMethod());
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PaymentMethod()));
                  },
                  child: Container(
                    height: 38.0,
                    width: 122.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0),
                      color: Colors.orange,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 4.0, bottom: 4.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_box_outlined,
                            color: Colors.black,
                            size: 18,
                          ),
                          Text(
                            'Add to cart',
                            style: kTextJourney7,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
