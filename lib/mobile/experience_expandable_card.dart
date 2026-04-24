import 'package:bohdan_bats_portfolio/experience/experience_item.dart';
import 'package:bohdan_bats_portfolio/mobile/experience_company_inline_link.dart';
import 'package:bohdan_bats_portfolio/mobile/experience_expanded_body.dart';
import 'package:bohdan_bats_portfolio/mobile/experience_role_chip.dart';
import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceExpandableCard extends StatelessWidget {
  final ExperienceItem item;
  final bool expanded;
  final VoidCallback onHeaderTap;

  const ExperienceExpandableCard({
    super.key,
    required this.item,
    required this.expanded,
    required this.onHeaderTap,
  });

  static const double _logoSize = 52;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstants.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppConstants.borderColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onHeaderTap,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLogo(),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.role,
                            style: GoogleFonts.openSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppConstants.secondaryColor,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: 6),
                          ExperienceCompanyInlineLink(
                            name: item.company,
                            url: item.companyUrl,
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 6,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                item.period,
                                style: GoogleFonts.openSans(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppConstants.textMutedColor,
                                ),
                              ),
                              ExperienceRoleChip(
                                label: item.mobileEmploymentChip,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      turns: expanded ? 0.25 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: AppConstants.textMutedColor,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: ExperienceExpandedBody(item: item),
            crossFadeState: expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: _logoSize,
        height: _logoSize,
        color: AppConstants.surfaceColor,
        child: item.imagePath.endsWith('.svg')
            ? Padding(
                padding: const EdgeInsets.all(6),
                child: SvgPicture.asset(item.imagePath, fit: BoxFit.contain),
              )
            : Image.asset(
                item.imagePath,
                fit: BoxFit.cover,
                width: _logoSize,
                height: _logoSize,
              ),
      ),
    );
  }
}
