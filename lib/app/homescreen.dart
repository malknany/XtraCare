// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/pages/Doctor.dart';
import 'package:flutter_application_1/app/pages/chat.dart';
import 'package:flutter_application_1/app/pages/payment.dart';
import 'package:flutter_application_1/const/container.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [Image.asset("imag/logo1.png")],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [
            Container(
              padding: EdgeInsets.only(left: 27),
              height: 60,
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Health",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
              bottun(
                  img: "imag/homepag/chat.png",
                  text1: "Chat",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Chat()));
                  }),
              bottun(
                  img: "imag/homepag/doctor.png",
                  text1: "Doctor",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => doctor()));
                  }),
            ]),
            Row(
              children: [
                bottun(
                    img: "imag/homepag/payment.png",
                    text1: "Payment",
                    ontap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => payment()));
                    }),
                bottun(
                    img: "imag/homepag/medical1.png",
                    text1: "Medical",
                    ontap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Chat()));
                    }),
              ],
            )
          ]),
        ));
  }
}
