// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset("imag/logo2.png")],
        backgroundColor: Color.fromARGB(255, 84, 201, 84),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height / 1.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: 150,
                color: Color.fromARGB(255, 84, 201, 84),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset("imag/man.png"),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          Column(
                            children: [
                              Text(
                                "Patient Name",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Patient ID",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                    ]),
              ),
              SizedBox(
                width: 325,
                child: Container(
                  //alignment: Alignment.center,

                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: "Name",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 325,
                child: Container(
                  //alignment: Alignment.center,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: "Email Address",
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  width: 325,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_iphone),
                      hintText: "Phone",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 325,
                child: Container(
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.map_rounded),
                      hintText: "City",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 325,
                child: Container(
                  padding: EdgeInsets.only(bottom: 30),
                  alignment: Alignment.center,
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: "Password",
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
