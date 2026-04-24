import 'package:bohdan_bats_portfolio/experience/experience_company_link.dart';
import 'package:bohdan_bats_portfolio/experience/experience_employment_badge.dart';
import 'package:bohdan_bats_portfolio/experience/experience_item.dart';
import 'package:bohdan_bats_portfolio/experience/experience_tech_chip.dart';
import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceTimelineEntry extends StatelessWidget {
  final ExperienceItem item;
  final bool isFirst;
  final bool isLast;

  const ExperienceTimelineEntry({
    super.key,
    required this.item,
    required this.isFirst,
    required this.isLast,
  });

  static const double _logoSize = 56;
  static const double _railWidth = 72;
  static const double _spacingBeforeNextEntry = 36;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: _railWidth,
            child: Column(
              children: [
                if (!isFirst)
                  Center(
                    child: Container(
                      width: 2,
                      height: 20,
                      color: AppConstants.borderColor,
                    ),
                  ),
                Center(child: _buildLogo()),
                if (!isLast)
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 2,
                        color: AppConstants.borderColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      Text(
                        item.role,
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppConstants.secondaryColor,
                        ),
                      ),
                      ExperienceEmploymentBadge(label: item.employmentBadge),
                    ],
                  ),
                  if (item.employmentDetail != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.employmentDetail!,
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: AppConstants.textMutedColor,
                      ),
                    ),
                  ],
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ExperienceCompanyLink(
                          name: item.company,
                          url: item.companyUrl,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        item.period,
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppConstants.textMutedColor,
                        ),
                      ),
                    ],
                  ),
                  if (item.description != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      item.description!,
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        height: 1.55,
                        color: AppConstants.secondaryColor,
                      ),
                    ),
                  ],
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: parseTechStack(
                      item.techStack,
                    ).map((tag) => ExperienceTechChip(label: tag)).toList(),
                  ),
                  if (item.achievements.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    ...item.achievements.map(
                      (a) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 7, right: 10),
                              child: Container(
                                width: 5,
                                height: 5,
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
                                  fontSize: 14,
                                  height: 1.5,
                                  color: AppConstants.secondaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  if (!isLast) const SizedBox(height: _spacingBeforeNextEntry),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: _logoSize,
      height: _logoSize,
      decoration: BoxDecoration(
        color: AppConstants.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppConstants.borderColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: item.imagePath.endsWith('.svg')
          ? Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(item.imagePath, fit: BoxFit.contain),
            )
          : Image.asset(item.imagePath, fit: BoxFit.cover),
    );
  }
}
