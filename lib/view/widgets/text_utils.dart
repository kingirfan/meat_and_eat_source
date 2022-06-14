import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color colors;
  TextDecoration textDecoration;


  TextUtils({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.colors,
    required this.textDecoration
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        decoration: textDecoration,
          textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: colors,
        )
      ),
    );
  }
}
