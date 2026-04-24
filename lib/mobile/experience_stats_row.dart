import 'package:bohdan_bats_portfolio/mobile/experience_stat_card.dart';
import 'package:flutter/material.dart';

class ExperienceStatsRow extends StatelessWidget {
  final String techDisplay;

  const ExperienceStatsRow({super.key, required this.techDisplay});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ExperienceStatCard(
            icon: Icons.calendar_today_outlined,
            value: '5+',
            label: 'Years',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ExperienceStatCard(
            icon: Icons.business_outlined,
            value: '4',
            label: 'Companies',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ExperienceStatCard(
            icon: Icons.layers_outlined,
            value: techDisplay,
            label: 'Technologies',
          ),
        ),
      ],
    );
  }
}
