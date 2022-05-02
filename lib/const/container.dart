// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class bottun extends StatefulWidget {
  final String img;
  final String text1;
  const bottun({Key? key, required this.img, required this.text1}) : super(key: key);

  @override
  State<bottun> createState() => _bottunState();
}

class _bottunState extends State<bottun> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 84, 201, 84),
        borderRadius: BorderRadius.circular(13),
      ),
      margin: EdgeInsets.symmetric(horizontal: 27,vertical: 12),
      child: Material(
        borderRadius: BorderRadius.circular(13),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        type: MaterialType.transparency,
        child: InkWell(
            splashColor: Colors.green[800],
            onTap: () {},
            child: IntrinsicHeight(
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    widget.img,
                    height: 150,
                    width: 145,
                    //todo : prefer using size with media query to avoid the overflow
                  ),
                  Text(
                    widget.text1,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
