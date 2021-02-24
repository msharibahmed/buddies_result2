import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  var mailUrl =
      'mailto:msharibahmed@gmail.com?subject=Regarding%20a%20query%20in%20buddies%20result%202.0.&body=Please%20write%20the%20query.';
  var linkedinUrl = 'https://www.linkedin.com/in/sharib-ahmed/';
  var instagramUrl = 'https://www.instagram.com/i._.m._.sharib/';
  var facebookUrl = 'https://www.facebook.com/MSharib786';
  var githubUrl ='https://github.com/msharibahmed';
  TextStyle style() {
    return GoogleFonts.openSans();
  }

  SizedBox sz({double w, double h}) {
    return SizedBox(
      height: h,
      width: w,
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.black,
        ));
  }

  InputDecoration decoration(String hintText, String errorText) {
    return InputDecoration(
        border: border(),
        errorText: errorText,
        hintText: hintText,
        enabledBorder: border(),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.black,
            )),
        errorBorder: border());
  }
}
