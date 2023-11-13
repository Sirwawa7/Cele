import 'package:bustick/utils/custom_style.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bustick/screens/onboard/on_board_screen.dart';
import 'package:bustick/screens/onboard/data.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
          () {
        // Navigate to the onboarding screen with title3
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => OnBoardScreen(
              initialItem: OnBoardingItems.loadOnboardItem()[2], // Index 2 corresponds to title3
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: CustomStyle.bgColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_logo.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            SizedBox(height: 20.0),
            Text(
              "© 2023 Wandile and Maxwell. All rights reserved.",
              style: TextStyle(color: Colors.white, fontSize: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}