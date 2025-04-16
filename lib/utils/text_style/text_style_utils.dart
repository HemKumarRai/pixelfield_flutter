import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleUtils{
  TextStyleUtils._();
  static  TextStyle titleSmall = GoogleFonts.lato(
    textStyle: const TextStyle(
        color:  Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.normal),
  );
  static  TextStyle bodyLarge = GoogleFonts.lato(
    textStyle: const TextStyle(
        color:  Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold),
  );
  static  TextStyle titleMedium = GoogleFonts.ebGaramond(
    textStyle: const TextStyle(
        color:  Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.normal),
  );
  static  TextStyle bodySmall = GoogleFonts.lato(
    textStyle: const TextStyle(
        color:  Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.normal),
  );
  static  TextStyle bodyMedium = GoogleFonts.ebGaramond(
    textStyle: const TextStyle(
        color:  Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.normal),
  );
}
