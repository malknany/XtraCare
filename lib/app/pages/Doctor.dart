// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, camel_case_types, sized_box_for_whitespace, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/const/slide.dart';

class doctor extends StatefulWidget {
  const doctor({Key? key}) : super(key: key);

  @override
  State<doctor> createState() => _doctorState();
}

class _doctorState extends State<doctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset("imag/logo1.png")],
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            "Doctors",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        slide(
          img: "imag/doctors/doctor3.jpeg",
          namedoc: "Dr.Salm",
          txt1: "Psychiatrist , therapist",
        ),
        slide(
          img: "imag/doctors/doctor2.jpeg",
          namedoc: "Dr.kinany",
          txt1: "Otolaryngologist , Ear , Nose and Throat Specialist",
        ),
        slide(
          img: "imag/doctors/doctor1.jpeg",
          namedoc: 'Dr.Sara Ahmed',
          txt1: "Ophthalmologist , Eyes Specialist",
        ),
        slide(
          img: "imag/doctors/doctor3.jpeg",
          namedoc: "Dr.Salm",
          txt1: "Psychiatrist , therapist",
        ),
        slide(
          img: "imag/doctors/doctor2.jpeg",
          namedoc: "Dr.kinany",
          txt1: "Otolaryngologist , Ear , Nose and Throat Specialist",
        ),
        slide(
          img: "imag/doctors/doctor1.jpeg",
          namedoc: 'Dr.Sara Ahmed',
          txt1: "Ophthalmologist , Eyes Specialist",
        ),
      ]),
    );
  }
}
