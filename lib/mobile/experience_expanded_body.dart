import 'package:bohdan_bats_portfolio/experience/experience_item.dart';
import 'package:bohdan_bats_portfolio/experience/experience_tech_chip.dart';
import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceExpandedBody extends StatelessWidget {
  final ExperienceItem item;

  const ExperienceExpandedBody({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final tags = parseTechStack(item.techStack);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(height: 1, thickness: 1, color: AppConstants.borderColor),
          if (item.description != null) ...[
            const SizedBox(height: 12),
            Text(
              item.description!,
              style: GoogleFonts.openSans(
                fontSize: 14,
                height: 1.5,
                color: AppConstants.secondaryColor,
              ),
            ),
          ],
          if (tags.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags
                  .map((tag) => ExperienceTechChip(label: tag))
                  .toList(),
            ),
          ],
          if (item.achievements.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...item.achievements.map(
              (a) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6, right: 8),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppConstants.textMutedColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        a,
                        style: GoogleFonts.openSans(
                          fontSize: 13,
                          height: 1.45,
                          color: AppConstants.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
