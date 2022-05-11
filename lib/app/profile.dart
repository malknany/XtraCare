// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//import 'package:firebase_storage/firebase_storage.dart';
class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  final namecon = TextEditingController();
  final emailcon = TextEditingController();
  final phonecon = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  getData() async {
    /*await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });*/
    /*DocumentReference doc = FirebaseFirestore.instance
        .collection("Patient")
        .doc("mHgvgvIiGSpGkZZ0400F");
    await doc.get().then((value) {
      print(value.exists);
    });*/

    /*CollectionReference userf =
        FirebaseFirestore.instance.collection("Patient");
    await userf.where("age", isGreaterThan: 19).get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
        print("===============================");
      });
    });*/

    /*CollectionReference usersf =
        FirebaseFirestore.instance.collection("Patient");
    await usersf.get().then((value) => {
          value.docs.forEach((element) {
            print(element.data());
            print(
                "=================================================================");
          })
        });*/
  }

  @override
  void initState() {
    print("=========================================");
    getData();
    super.initState();
  }

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
              FlatButton(
                  onPressed: () async {
                    DocumentSnapshot data = await FirebaseFirestore.instance
                        .collection("Patient")
                        .doc("mHgvgvIiGSpGkZZ0400F")
                        .get();
                    print("======================================");
                    print(data.data());
                  },
                  child: Text("get data"))
            ],
          ),
        )),
      ),
    );
  }
}
