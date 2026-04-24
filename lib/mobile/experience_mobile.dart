import 'package:bohdan_bats_portfolio/experience/experience_item.dart';
import 'package:bohdan_bats_portfolio/experience/portfolio_experiences.dart';
import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:bohdan_bats_portfolio/mobile/drawer_mobile.dart';
import 'package:bohdan_bats_portfolio/mobile/experience_expandable_card.dart';
import 'package:bohdan_bats_portfolio/mobile/experience_stats_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Mobile Experience: header, stat cards, expandable role rows (reference UI).
class ExperienceMobile extends StatefulWidget {
  const ExperienceMobile({super.key});

  @override
  State<ExperienceMobile> createState() => _ExperienceMobileState();
}

class _ExperienceMobileState extends State<ExperienceMobile> {
  int? _expandedIndex;

  static final List<ExperienceItem> _experiences = portfolioExperiences;

  @override
  Widget build(BuildContext context) {
    final uniqueTechCount = countUniqueTechnologies(_experiences);
    final techDisplay = uniqueTechCount >= 15 ? '15+' : '$uniqueTechCount+';

    return Scaffold(
      backgroundColor: AppConstants.scaffoldBackgroundColor,
      endDrawer: const DrawerMobile(),
      appBar: AppBar(
        backgroundColor: AppConstants.scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: AppConstants.secondaryColor),
        actions: [
          Builder(
            builder: (scaffoldContext) => IconButton(
              icon: const Icon(Icons.menu_rounded, size: 28),
              onPressed: () => Scaffold.of(scaffoldContext).openEndDrawer(),
              tooltip: 'Menu',
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          ExperienceStatsRow(techDisplay: techDisplay),
          const SizedBox(height: 20),
          ...List.generate(
            _experiences.length,
            (i) => Padding(
              padding: EdgeInsets.only(
                bottom: i < _experiences.length - 1 ? 12 : 0,
              ),
              child: ExperienceExpandableCard(
                item: _experiences[i],
                expanded: _expandedIndex == i,
                onHeaderTap: () {
                  setState(() {
                    _expandedIndex = _expandedIndex == i ? null : i;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppConstants.surfaceColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppConstants.borderColor),
          ),
          child: Icon(
            Icons.work_outline_rounded,
            size: 22,
            color: AppConstants.textMutedColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Experience',
                style: GoogleFonts.openSans(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppConstants.secondaryColor,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Tap to expand details',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppConstants.textMutedColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
