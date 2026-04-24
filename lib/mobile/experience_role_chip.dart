import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceRoleChip extends StatelessWidget {
  final String label;

  const ExperienceRoleChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppConstants.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppConstants.borderColor),
      ),
      child: Text(
        label,
        style: GoogleFonts.openSans(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppConstants.textMutedColor,
        ),
      ),
    );
  }
}
