import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Nunito {
  static TextStyle body({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return GoogleFonts.nunitoSans(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
