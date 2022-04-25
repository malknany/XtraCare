// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Log&Rig/LogIn.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "XtraCare",
      home: AnimatedSplashScreen(
        splash: Image.asset("imag/logo.png"),
        splashIconSize: 200,
        nextScreen: home(),
        splashTransition: SplashTransition.sizeTransition,
      ),
    ),
  );
}
