// ignore_for_file: camel_case_types, file_names, use_key_in_widget_constructors, prefer_const_constructors, annotate_overrides, avoid_unnecessary_containers, deprecated_member_use, sized_box_for_whitespace, unused_import, avoid_print, unnecessary_null_comparison

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Log&Rig/LogIn.dart';
import 'package:flutter_application_1/app/yourhealth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class rigister extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return rigisterpage();
  }
}

class rigisterpage extends State<rigister> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  // Future signUp() async {
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: myemail.text, password: mypassword.text);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
       // showLoading(context);
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: myemail.text, password: mypassword.text);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              dialogType: DialogType.ERROR,
              body: const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                      "كلمة المرور ضعيفة يجب ان تتكون علي الاقل من ستة ارقام او حروف")))
              .show();  } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              dialogType: DialogType.ERROR,
              body: const Text(
                  "البريد الالكتروني موجود بالفعل ، الرجاء ادخال بريد اخر"))
              .show();}
        else  if (e.code == 'user-not-found') {

          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              dialogType: DialogType.ERROR,
              body: const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                      "No user found for that email.")))
              .show();

               }
      } catch (e) {
        print(e);
      }
    }
  }

  final myname = TextEditingController();
  final mypassword = TextEditingController();
  final myphone = TextEditingController();
  final myemail = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset("imag/logo1.png")],
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formstate,
          child: Column(
            ////// form state
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                child: Text(
                  "Create Your Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 325,
                child: Container(
                  padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: myname,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "pleas enter your Name";
                      }
                      if (val.length > 100) {
                        return " Name is very long";
                      }
                      if (val.length < 2) {
                        return " Name is very short";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      myname.text = val!;
                    },
                    autofocus: false,
                    textInputAction: TextInputAction.next,
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
                  padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: myemail,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "pleas enter your Email Address";
                      }
                      if (val.length > 100) {
                        return "Email is very long";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(val)) {
                        return "Email is NotValid";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      myemail.text = val!;
                    },
                    autofocus: false,
                    textInputAction: TextInputAction.next,
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
                  padding: EdgeInsets.only(bottom: 30, top: 30),
                  width: 325,
                  child: TextFormField(
                    controller: myphone,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "pleas enter your Phone";
                      }
                      if (val.length > 25) {
                        return "Phone Number is very long";
                      }
                      if (val.length < 8) {
                        return "Phone Number is so short";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      myphone.text = val!;
                    },
                    autofocus: false,
                    textInputAction: TextInputAction.next,
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
                  padding: EdgeInsets.only(bottom: 30),
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: mypassword,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "pleas enter your Password";
                      }
                      if (val.length > 100) {
                        return "Password is very long";
                      }
                      if (val.length < 8) {
                        return "Password is so short";
                      }
                      return null;
                    },
                    onSaved: (val) {
                      mypassword.text = val!;
                    },
                    autofocus: false,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: "Password",
                    ),
                  ),
                ),
              ),
              Container(
                width: 325,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    if (formstate.currentState != null &&
                        formstate.currentState!.validate()) {
                      signUp();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => homepageh()));
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  color: Color.fromARGB(255, 84, 201, 84),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have Account ? "),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: ((context) => home())));
                    },
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                        color: Color.fromARGB(255, 84, 201, 84),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
