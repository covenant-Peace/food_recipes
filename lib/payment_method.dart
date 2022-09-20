// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:food_recipes/paymentFile/payment.dart';
import 'package:food_recipes/paystack.dart';
import 'package:food_recipes/view/shopping_page.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pay/pay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bottom_navigation.dart';
import 'card_number.dart';
import 'constants.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  BottomNavigation just;

  List<CardNumber> peace = [
    CardNumber(),
    CardNumber(),
    CardNumber(),
    CardNumber(),
  ];

  Paymentcard selectedCard;
  TextEditingController contNum = TextEditingController();
  TextEditingController contCvv = TextEditingController();
  TextEditingController contMon = TextEditingController();
  TextEditingController contYear = TextEditingController();

  // final contNum = TextEditingController();

  final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  //PAYSTACK

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _verticalSizeBox = const SizedBox(height: 20.0);
  final _horizontalSizeBox = const SizedBox(width: 10.0);
  final plugin = PaystackPlugin();
  final _border = Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.red,
  );
  int _radioValue = 0;
  CheckoutMethod _method = CheckoutMethod.card;
  bool _inProgress = false;
  String _cardNumber;
  String _cvv;
  int _expiryMonth;
  int _expiryYear;

  @override
  void initState() {
    plugin.initialize(publicKey: paystackPublicKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF222222),
      bottomNavigationBar: just,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 36, right: 36, top: 26, bottom: 36),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    FocusScope.of(context).unfocus();
                  },
                  child: Icon(
                    Icons.keyboard_arrow_left_sharp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Payment Method',
                  style: kTextJourney11,
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
            SizedBox(
              height: 35.0,
            ),
            Text(
              'Saved payment card',
              style: kTextJourney9,
            ),
            SizedBox(
              height: 34.0,
            ),
            Container(
              width: 354.0,
              height: 56.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFF222222),
                  border: Border(
                    top: BorderSide(
                        color: Colors.orange,
                        width: 1,
                        style: BorderStyle.solid),
                    bottom: BorderSide(
                        color: Colors.orange,
                        width: 1,
                        style: BorderStyle.solid),
                    left: BorderSide(
                        color: Colors.orange,
                        width: 1,
                        style: BorderStyle.solid),
                    right: BorderSide(
                        color: Colors.orange,
                        width: 1,
                        style: BorderStyle.solid),
                  )),
              child: ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    labelText: 'Cardholder\'s name',
                    labelStyle: kTextJourney5,
                    border: InputBorder.none,
                  ),
                  obscureText: false,
                  style: kTextJourney5,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              'Card Number',
              style: kTextJourney17,
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 56.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFF222222),
                  border: Border(
                    top: BorderSide(
                        color: Color(0xFFBDBDBD),
                        width: 1,
                        style: BorderStyle.solid),
                    bottom: BorderSide(
                        color: Color(0xFFBDBDBD),
                        width: 1,
                        style: BorderStyle.solid),
                    left: BorderSide(
                        color: Color(0xFFBDBDBD),
                        width: 1,
                        style: BorderStyle.solid),
                    right: BorderSide(
                        color: Color(0xFFBDBDBD),
                        width: 1,
                        style: BorderStyle.solid),
                  )),
              child: ListTile(
                title: TextFormField(
                  decoration: InputDecoration(
                    hintText: '1234',
                    hintStyle: kTextJourney16,
                    border: InputBorder.none,
                  ),
                  obscureText: false,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: kTextJourney17,
                  cursorColor: Colors.white,
                  controller: contNum,
                  focusNode: FocusNode(),
                  keyboardType: TextInputType.phone,
                  onSaved: (String value) => _cardNumber = value,
                  onChanged: (newText) {
                    if (newText.length == 16) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  onEditingComplete: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Expiration date',
                  style: kTextJourney17,
                ),
                Text(
                  'cvv/cvc',
                  style: kTextJourney17,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 65.0,
                  height: 56.0,
                  // margin: EdgeInsets.only(left: 36.0, right: 38.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFF222222),
                      border: Border(
                        top: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        bottom: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        left: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        right: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                      )),
                  child: ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(
                        // hintText: '1234',
                        // hintStyle: kTextJourney16,
                        border: InputBorder.none,
                      ),
                      obscureText: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: kTextJourney16,
                      cursorColor: Colors.white,
                      controller: contMon,
                      keyboardType: TextInputType.phone,
                      onSaved: (String value) =>
                          _expiryMonth = int.tryParse(value ?? ""),
                      onChanged: (newText) {
                        // cpNumber = newText;
                        if (newText.length == 2) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  width: 65.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFF222222),
                      border: Border(
                        top: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        bottom: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        left: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        right: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                      )),
                  child: ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(
                        // hintText: '1234',
                        // hintStyle: kTextJourney16,
                        border: InputBorder.none,
                      ),
                      obscureText: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: kTextJourney16,
                      cursorColor: Colors.white,
                      controller: contYear,
                      keyboardType: TextInputType.phone,
                      onSaved: (String value) =>
                          _expiryYear = int.tryParse(value ?? ""),
                      onChanged: (newText) {
                        // cpNumber = newText;
                        if (newText.length == 2) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 46.0,
                ),
                Container(
                  width: 100.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFF222222),
                      border: Border(
                        top: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        bottom: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        left: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                        right: BorderSide(
                            color: Color(0xFFBDBDBD),
                            width: 1,
                            style: BorderStyle.solid),
                      )),
                  child: ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      obscureText: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: kTextJourney17,
                      keyboardType: TextInputType.phone,
                      controller: contCvv,
                      onSaved: (String value) => _cvv = value,
                      onChanged: (newText) {
                        if (newText.length == 3) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70.0,
            ),
            GestureDetector(
              onTap: () {
                _handleCheckout(context);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => HomePage()
                //         // BottomNavigation(4)
                //         ));
              },
              child: Container(
                height: 56.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48.0),
                  color: Color(0xFFEDA92E),
                ),
                alignment: Alignment.center,
                child: Builder(
                  builder: (context) {
                    return _inProgress
                        ? Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            child: Platform.isIOS
                                ? const CupertinoActivityIndicator()
                                : const CircularProgressIndicator(),
                          )
                        : Flexible(
                            flex: 2,
                            child: Text(
                              'Add card',
                              style: kTextJourney4,
                              textAlign: TextAlign.center,
                            ),
                          );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // GooglePayButton(
            //   width: 300,
            //   paymentConfigurationAsset: 'gpay.json',
            //   paymentItems: _paymentItems,
            //   type: GooglePayButtonType.pay,
            //   margin: const EdgeInsets.only(top: 15.0),
            //   onPaymentResult: onGooglePayResult,
            //   loadingIndicator: const Center(
            //     child: CircularProgressIndicator(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChanged(int value) {
    if (value != null) setState(() => _radioValue = value);
  }

  _handleCheckout(BuildContext context) async {
    if (_method != CheckoutMethod.card && _isLocal) {
      // _showMessage('Select server initialization method at the top');
      return;
    }
    setState(() => _inProgress = true);
    _formKey.currentState?.save();
    Charge charge = Charge()
      ..amount = 10000
          // ShoppingPage().debin // In base currency
      ..email = FirebaseAuth.instance.currentUser.email
      ..card = _getCardFromUI();

    if (!_isLocal) {
      var accessCode = await _fetchAccessCodeFrmServer(_getReference());
      charge.accessCode = accessCode;
    } else {
      charge.reference = _getReference();
    }

    try {
      CheckoutResponse response = await plugin.checkout(
        context,
        method: _method,
        charge: charge,
        fullscreen: false,
        logo: MyLogo(),
      );
      print('Response = $response');
      setState(() => _inProgress = false);
      _updateStatus(response.reference, '$response');
    } catch (e) {
      setState(() => _inProgress = false);
      // _showMessage("Check console for error");
      rethrow;
    }
  }

  _startAfreshCharge() async {
    _formKey.currentState?.save();

    Charge charge = Charge();
    charge.card = _getCardFromUI();

    setState(() => _inProgress = true);

    if (_isLocal) {
      // Set transaction params directly in app (note that these params
      // are only used if an access_code is not set. In debug mode,
      // setting them after setting an access code would throw an exception

      charge
        ..amount = 10000 // In base currency
        ..email = 'customer@email.com'
        ..reference = _getReference()
        ..putCustomField('Charged From', 'Flutter SDK');
      _chargeCard(charge);
    } else {
      // Perform transaction/initialize on Paystack server to get an access code
      // documentation: https://developers.paystack.co/reference#initialize-a-transaction
      charge.accessCode = await _fetchAccessCodeFrmServer(_getReference());
      _chargeCard(charge);
    }
  }

  _chargeCard(Charge charge) async {
    final response = await plugin.chargeCard(context, charge: charge);

    final reference = response.reference;

    // Checking if the transaction is successful
    if (response.status) {
      _verifyOnServer(reference);
      return;
    }

    // The transaction failed. Checking if we should verify the transaction
    if (response.verify) {
      _verifyOnServer(reference);
    } else {
      setState(() => _inProgress = false);
      _updateStatus(reference, response.message);
    }
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: contNum.text.trim(),
      cvc: contCvv.text.trim(),
      expiryMonth: int.parse(contMon.text.trim()),
      expiryYear: int.parse(contYear.text.trim()),
    );

    // Using Cascade notation (similar to Java's builder pattern)
//    return PaymentCard(
//        number: cardNumber,
//        cvc: cvv,
//        expiryMonth: expiryMonth,
//        expiryYear: expiryYear)
//      ..name = 'Segun Chukwuma Adamu'
//      ..country = 'Nigeria'
//      ..addressLine1 = 'Ikeja, Lagos'
//      ..addressPostalCode = '100001';

    // Using optional parameters
//    return PaymentCard(
//        number: cardNumber,
//        cvc: cvv,
//        expiryMonth: expiryMonth,
//        expiryYear: expiryYear,
//        name: 'Ismail Adebola Emeka',
//        addressCountry: 'Nigeria',
//        addressLine1: '90, Nnebisi Road, Asaba, Deleta State');
  }

  Widget _getPlatformButton(String string, Function() function) {
    // is still in progress
    Widget widget;
    if (Platform.isIOS) {
      widget = CupertinoButton(
        onPressed: function,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        color: CupertinoColors.activeBlue,
        child: Text(
          string,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      widget = ElevatedButton(
        onPressed: function,
        child: Text(
          string.toUpperCase(),
          style: const TextStyle(fontSize: 17.0),
        ),
      );
    }
    return widget;
  }

  Future<String> _fetchAccessCodeFrmServer(String reference) async {
    String url = '$backendUrl/new-access-code';
    String accessCode;
    try {
      print("Access code url = $url");
      http.Response response = await http.get(Uri.parse(url));
      accessCode = response.body;
      print('Response for access code = $accessCode');
    } catch (e) {
      setState(() => _inProgress = false);
      _updateStatus(
          reference,
          'There was a problem getting a new access code form'
          ' the backend: ${e.message}');
    }

    return accessCode;
  }

  void _verifyOnServer(String reference) async {
    _updateStatus(reference, 'Verifying...');
    String url = '$backendUrl/verify/$reference';
    try {
      http.Response response = await http.get(Uri.parse(url));
      var body = response.body;
      _updateStatus(reference, body);
    } catch (e) {
      _updateStatus(
          reference,
          'There was a problem verifying %s on the backend: '
          '$reference ${e.message}');
    }
    setState(() => _inProgress = false);
  }

  _updateStatus(String reference, String message) {
    // _showMessage('Reference: $reference \n Response: $message',
    //     const Duration(seconds: 7));
  }

  _showMessage(String message,
      [Duration duration = const Duration(seconds: 4)]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: duration,
      action: SnackBarAction(
          label: 'CLOSE',
          onPressed: () =>
              ScaffoldMessenger.of(context).removeCurrentSnackBar()),
    ));
  }

  bool get _isLocal => _radioValue == 0;
}

class CardNumber1 extends StatelessWidget {
  final String monORyear;

  CardNumber1({this.monORyear});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.0,
      height: 56.0,
      // margin: EdgeInsets.only(left: 36.0, right: 38.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xFF222222),
          border: Border(
            top: BorderSide(
                color: Color(0xFFBDBDBD), width: 1, style: BorderStyle.solid),
            bottom: BorderSide(
                color: Color(0xFFBDBDBD), width: 1, style: BorderStyle.solid),
            left: BorderSide(
                color: Color(0xFFBDBDBD), width: 1, style: BorderStyle.solid),
            right: BorderSide(
                color: Color(0xFFBDBDBD), width: 1, style: BorderStyle.solid),
          )),
      child: ListTile(
        title: TextFormField(
          decoration: InputDecoration(
            // hintText: '1234',
            // hintStyle: kTextJourney16,
            border: InputBorder.none,
          ),
          obscureText: false,
          inputFormatters: [
            LengthLimitingTextInputFormatter(2),
            FilteringTextInputFormatter.digitsOnly
          ],
          style: kTextJourney16,
          cursorColor: Colors.white,
          keyboardType: TextInputType.phone,
          onChanged: (newText) {
            // cpNumber = newText;
            if (newText.length == 2) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}

var banks = ['Selectable', 'Bank', 'Card'];

CheckoutMethod _parseStringToMethod(String string) {
  CheckoutMethod method = CheckoutMethod.selectable;
  switch (string) {
    case 'Bank':
      method = CheckoutMethod.bank;
      break;
    case 'Card':
      method = CheckoutMethod.card;
      break;
  }
  return method;
}

class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: const Text(
        "CO",
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

const Color green = Color(0xFF3db76d);
const Color lightBlue = Color(0xFF34a5db);
const Color navyBlue = Color(0xFF031b33);
