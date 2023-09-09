import 'package:flutter/material.dart';

class Helvetica {
  static TextStyle body({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontFamily: 'helvetica',
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle header({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(
      fontFamily: 'helvetica',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
    );
  }
}
