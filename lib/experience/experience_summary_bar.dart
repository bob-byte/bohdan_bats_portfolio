import 'package:bohdan_bats_portfolio/experience/experience_summary_column.dart';
import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';

class ExperienceSummaryBar extends StatelessWidget {
  final String techDisplay;

  const ExperienceSummaryBar({super.key, required this.techDisplay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      decoration: BoxDecoration(
        color: AppConstants.panelMutedColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppConstants.borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const ExperienceSummaryColumn(value: '5+', label: 'Years Experience'),
          Container(width: 1, height: 48, color: AppConstants.borderColor),
          const ExperienceSummaryColumn(value: '4', label: 'Companies'),
          Container(width: 1, height: 48, color: AppConstants.borderColor),
          ExperienceSummaryColumn(value: techDisplay, label: 'Technologies'),
        ],
      ),
    );
  }
}
