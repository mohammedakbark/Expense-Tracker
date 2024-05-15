import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeTextStyle {
  static TextStyle poppinsStyle({FontWeight? fontWeight,double? fontSize,double? letterSpacing,Color? color}) {
    return GoogleFonts.poppins(
      fontWeight:fontWeight,
      fontSize:fontSize,
      letterSpacing:letterSpacing,
      color:color
    );
  }
}
