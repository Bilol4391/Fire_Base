import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeText {


  static const primaryColor = Color(0xffF43F5E);

  static const TextStyle topTitle = TextStyle(
      fontFamily: 'Source Sans Pro',
      color: Color(0xff09101D),
      fontSize: 23,
      fontWeight: FontWeight.w600);

  static const TextStyle haveAccount = TextStyle(
      fontFamily: 'Source Sans Pro',
      color: Color(0xff858C94),
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static const TextStyle signIn = TextStyle(
      fontFamily: 'Source Sans Pro',
      color: Color(0xffF43F5E),
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static const TextStyle chegirma = TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xffffffff),
      fontSize: 20,
      fontFamily: "akshar");

  static const TextStyle horizontalProduct = TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xff111111),
      fontSize: 20,
      fontFamily: "akshar");

  static textStyleRegular(
      {double size = 18,
        Color textColor = Colors.black,

      }) =>
      GoogleFonts.sourceSansPro(
          fontWeight: FontWeight.w600,
          color: textColor,


          fontSize: size
      );

  static textStyleRegular2(
      {double size = 16,
        Color textColor = Colors.black,

      }) =>
      GoogleFonts.sourceSansPro(
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: size
      );
}
