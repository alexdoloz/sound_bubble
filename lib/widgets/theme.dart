import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final circularBorder = BorderRadius.circular(15.0);

  static const buttonGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 216, 124, 226),
      Color.fromARGB(255, 199, 62, 81),
    ],
    transform: GradientRotation(pi / 3)
  );

  static const buttonGradient2 = LinearGradient(
    colors: [
      Color.fromARGB(255, 133, 45, 229),
      Color.fromARGB(255, 92, 56, 193),
    ],
    transform: GradientRotation(pi / 4)
  );

  static final theme = ThemeData(
    primaryColor: const Color(0xff91a2f8),
    fontFamily: 'Roboto',
    brightness: Brightness.dark,
    backgroundColor: const Color(0xff2f2f2f),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xff3f3f3f),
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.roboto(
        color: const Color(0xfffafafa),
        fontWeight: FontWeight.w900,
        fontSize: 48,
      ),
      headline2: GoogleFonts.montserrat(
        color: const Color(0xffdddddd),
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      headline3: GoogleFonts.roboto(
        fontWeight: FontWeight.w900,
        color: const Color(0xffffffff),
        fontSize: 36,
      ),
      headline4: GoogleFonts.roboto(
        fontWeight: FontWeight.w900,
        color: const Color(0xffffffff),
        fontSize: 24,
      ),
      caption: GoogleFonts.roboto(
        fontWeight: FontWeight.normal,
        color: const Color(0xffffffff),
        fontSize: 18,
      ),
      subtitle1: GoogleFonts.roboto(
        fontWeight: FontWeight.normal,
        color: const Color(0xffc4c4c4),
        fontSize: 14,
      ),
      subtitle2: GoogleFonts.roboto(
        fontWeight: FontWeight.normal,
        color: const Color(0xffcdcdcd),
        fontSize: 14,
      ), 
      headline5: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.montserrat(
          fontSize: 12.8,
          color: const Color(0xffffffff),
          fontWeight: FontWeight.bold,
        ),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: circularBorder,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: circularBorder,
        borderSide: BorderSide.none,
      ),
    
      fillColor: const Color(0xff4d4d4d),
      filled: true,
      hintStyle: GoogleFonts.montserrat(
        fontSize: 11,
        color: Colors.white,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff91a2f8),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      circularTrackColor: Color.fromARGB(255, 199, 62, 81),
      color: Color.fromARGB(255, 199, 62, 81),
    )
  );
}