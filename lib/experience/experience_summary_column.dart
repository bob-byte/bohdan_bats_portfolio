import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceSummaryColumn extends StatelessWidget {
  final String value;
  final String label;

  const ExperienceSummaryColumn({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.openSans(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppConstants.secondaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppConstants.textMutedColor,
          ),
        ),
      ],
    );
  }
}
