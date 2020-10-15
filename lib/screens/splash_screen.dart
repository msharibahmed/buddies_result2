import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return new Timer(duration, () {
      Navigator.pushReplacementNamed(context, Home.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Flex(
          children: [
            Image.asset(
              'assets/images/splash.gif',
              fit: BoxFit.contain,
            ),
            Text('BUDDIES RESULT 2.0',
                style: GoogleFonts.anton(
                    textStyle: const TextStyle(
                        letterSpacing: 2, color: Colors.white, fontSize: 25))),
            Text('CTENGG ZHCET',
                style: GoogleFonts.anton(
                    textStyle: const TextStyle(
                        letterSpacing: 1, color: Colors.white, fontSize: 25))),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, right: 16.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text('Created By: Sharib Ahmed',
                      style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 18)))),
            )
          ],
          direction: Axis.vertical,
        ));
  }
}
