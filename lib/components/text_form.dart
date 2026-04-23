import 'package:bohdan_bats_portfolio/components/sans.dart';
import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TextForm extends StatelessWidget {
  final String text;
  final double containerWidth;
  final String hitText;
  final int? maxLines;
  final TextEditingController? controller;

  const TextForm({
    super.key,
    required this.text,
    required this.containerWidth,
    required this.hitText,
    this.maxLines,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,

      children: [
        Sans(text: text, size: 16.0),
        SizedBox(height: 5),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            controller: controller,
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
            ],
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstants.errorColor),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstants.accentColor),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstants.primaryColor, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15.2)),
              ),
              hintText: hitText,
              hintStyle: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
