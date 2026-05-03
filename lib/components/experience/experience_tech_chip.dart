import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceTechChip extends StatelessWidget {
  final String label;

  const ExperienceTechChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: AppConstants.surfaceColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppConstants.borderColor),
      ),
      child: Text(
        label,
        style: GoogleFonts.openSans(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppConstants.secondaryColor,
        ),
      ),
    );
  }
}
