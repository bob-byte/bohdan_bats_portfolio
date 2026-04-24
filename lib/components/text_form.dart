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
  final FormFieldValidator<String>? validator;

  const TextForm({
    super.key,
    required this.text,
    required this.containerWidth,
    required this.hitText,
    this.maxLines,
    this.controller,
    this.validator,
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
            validator: validator,
            controller: controller,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstants.errorColor),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstants.errorColor),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstants.accentColor),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppConstants.primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15)),
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
