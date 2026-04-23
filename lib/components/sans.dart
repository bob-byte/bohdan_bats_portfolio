import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sans extends StatelessWidget {
  final String text;
  final double size;
  final TextAlign textAlign;

  const Sans({
    super.key,
    required this.text,
    required this.size,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size),
      textAlign: textAlign,
    );
  }
}
