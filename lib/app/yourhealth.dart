// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/profile.dart';
import 'package:flutter_application_1/app/calender.dart';
import 'package:flutter_application_1/app/homescreen.dart';

class homepageh extends StatefulWidget {
  const homepageh({Key? key}) : super(key: key);

  @override
  State<homepageh> createState() => _homepageState();
}

class _homepageState extends State<homepageh> {
  int currentIndex = 1;
  final scareens = [
    calender(),
    homescreen(),
    profilepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: scareens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
          elevation: 0,
          showUnselectedLabels: false,
          selectedItemColor: Color.fromARGB(255, 84, 201, 84),
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Calendar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: "Profile",
            ),
          ]),
    );
  }
}
