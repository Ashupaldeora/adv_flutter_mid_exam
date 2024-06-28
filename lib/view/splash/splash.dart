import 'dart:async';

import 'package:adv_flutter_mid_exam/view/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            )));

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Image.asset(
            "assets/image/Screenshot_2024-06-28_162751-removebg-preview.png"),
      ),
    );
  }
}
