import 'package:bohdan_bats_portfolio/desktop/all_desktop_tabs.dart';
import 'package:bohdan_bats_portfolio/desktop/drawer_desktop.dart';
import 'package:bohdan_bats_portfolio/experience/experience_item.dart';
import 'package:bohdan_bats_portfolio/experience/experience_summary_bar.dart';
import 'package:bohdan_bats_portfolio/experience/experience_timeline_entry.dart';
import 'package:bohdan_bats_portfolio/experience/portfolio_experiences.dart';
import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Desktop Experience: timeline layout, tech chips, summary stats (reference UI).
class ExperienceDesktop extends StatefulWidget {
  const ExperienceDesktop({super.key});

  @override
  State<ExperienceDesktop> createState() => _ExperienceDesktopState();
}

class _ExperienceDesktopState extends State<ExperienceDesktop> {
  @override
  Widget build(BuildContext context) {
    final experiences = portfolioExperiences;
    final uniqueTechCount = countUniqueTechnologies(experiences);
    final techDisplay = uniqueTechCount >= 15 ? '15+' : '$uniqueTechCount+';

    return Scaffold(
      drawer: const DrawerDesktop(),
      backgroundColor: AppConstants.surfaceColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 280,
              pinned: true,
              backgroundColor: AppConstants.surfaceColor,
              iconTheme: IconThemeData(
                size: 25,
                color: AppConstants.secondaryColor,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/developer_experience.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              title: const AllDesktopTabs(),
            ),
          ];
        },
        body: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(40, 40, 40, 56),
              children: [
                _buildHeader(),
                const SizedBox(height: 40),
                ...List.generate(
                  experiences.length,
                  (i) => ExperienceTimelineEntry(
                    item: experiences[i],
                    isFirst: i == 0,
                    isLast: i == experiences.length - 1,
                  ),
                ),
                const SizedBox(height: 48),
                ExperienceSummaryBar(techDisplay: techDisplay),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppConstants.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppConstants.borderColor),
          ),
          child: Icon(
            Icons.work_outline_rounded,
            size: 26,
            color: AppConstants.textMutedColor,
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Experience',
                style: GoogleFonts.openSans(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: AppConstants.secondaryColor,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'My professional journey and achievements',
                style: GoogleFonts.openSans(
                  fontSize: 16,
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
