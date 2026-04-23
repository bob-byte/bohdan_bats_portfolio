import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AbelCustom extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;

  const AbelCustom({
    super.key,
    required this.text,
    required this.size,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color ?? AppConstants.secondaryColor,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
