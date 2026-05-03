import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceEmploymentBadge extends StatelessWidget {
  final String label;

  const ExperienceEmploymentBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: AppConstants.chipBackgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppConstants.borderColor),
      ),
      child: Text(
        label,
        style: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppConstants.textMutedColor,
        ),
      ),
    );
  }
}
