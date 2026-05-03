import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceStatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const ExperienceStatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: AppConstants.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppConstants.borderColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22, color: AppConstants.textMutedColor),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppConstants.secondaryColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppConstants.textMutedColor,
            ),
          ),
        ],
      ),
    );
  }
}
