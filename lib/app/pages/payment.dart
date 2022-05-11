// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print, camel_case_types, unnecessary_new
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<payment> {
  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "[YOUR_API_KEY]",
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Sample App",
      "description": "Payment for the some random product",
      "prefill": {"contact": "2323232323", "email": "shdjsdh@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Pament success");
    Toast.show("Pament success", textStyle: context);
  }

  void handlerErrorFailure() {
    print("Pament error");
    Toast.show("Pament error", textStyle: context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet", textStyle: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "payment",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [Image.asset("imag/logo1.png")],
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(hintText: "amount to pay"),
            ),
            SizedBox(
              height: 12,
            ),
            RaisedButton(
              elevation: 0,
              color: Color.fromARGB(255, 84, 201, 84),
              child: Text(
                "pay now",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}
