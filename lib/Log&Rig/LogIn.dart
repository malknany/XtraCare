// ignore_for_file: camel_case_types, unused_import, use_key_in_widget_constructors, annotate_overrides, prefer_const_constructors, sized_box_for_whitespace, unnecessary_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, file_names, unnecessary_new, avoid_print, await_only_futures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Log&Rig/Rigister.dart';
import 'package:flutter_application_1/app/yourhealth.dart';
import 'package:flutter_application_1/app/homescreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return homepage();
  }
}

class homepage extends State<home> {
  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  // firebase
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String? errorMessage;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  Future<UserCredential> singinwithgoogle() async {
    final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleauth =
        await googleuser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleauth.idToken, accessToken: googleauth.accessToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signIn(String email, String password) async {
    if (formstate.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => homepageh())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  bool? box1 = false;
  void checkbox1(bool? val) {
    setState(() {
      box1 = val;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formstate,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.3,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset("imag/logo1.png"),
                  ),
                  //email filed
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: 325,
                    child: TextFormField(
                      controller: emailController,
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
                        emailController.text = val!;
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email Address",
                        //border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                      width: 325,
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: passwordController,
                        validator: (val) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (val!.isEmpty) {
                            return "Pleas enter password";
                          }
                          if (val.length > 100) {
                            return "password is long";
                          }
                          if (!regex.hasMatch(val)) {
                            return "password is short";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          passwordController.text = val!;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key_rounded),
                          hintText: "Password",
                        ),
                      )),
                  CheckboxListTile(
                    value: box1,
                    onChanged: checkbox1,
                    contentPadding: EdgeInsets.only(left: 45),
                    title: Text("Remember Me"),
                    checkColor: Colors.black,
                    activeColor: Colors.amber.shade900,
                    controlAffinity: ListTileControlAffinity.leading,
                    /*secondary: InkWell(
                      child: Text("Forgit Password ?"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => rigister())));
                      },
                    ),*/
                  ),
                  SizedBox(
                    width: 325,
                    height: 50,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        signIn(emailController.text, passwordController.text);
                        /*Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homepageh()));*/
                      },
                      child: Text(
                        "LOG IN",
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
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      /*SizedBox(
                          child: Container(
                        width: 175,
                        height: 50,
                        //alignment: Alignment.centerLeft,
                        // ignore: deprecated_member_use
                        child: RaisedButton.icon(
                          icon:
                              Icon(Icons.facebook, color: Colors.blue.shade900),
                          onPressed: () {},
                          label: Text(
                            "FACEBOOK",
                            style: TextStyle(
                                color: Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                              width: 1.5,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      )),*/
                      SizedBox(
                        child: Container(
                          width: 150,
                          height: 50,
                          // ignore: deprecated_member_use
                          child: RaisedButton.icon(
                            icon: Icon(
                              Icons.g_mobiledata,
                              color: Colors.red,
                              size: 35,
                            ),
                            onPressed: () async {
                              UserCredential cared = await singinwithgoogle();
                            },
                            label: Text(
                              "GOOGLE",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(
                                width: 1.5,
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have Any Account ? "),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => rigister())));
                        },
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Color.fromARGB(255, 84, 201, 84),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
