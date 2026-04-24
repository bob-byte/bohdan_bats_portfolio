import 'package:bohdan_bats_portfolio/desktop/all_desktop_tabs.dart';
import 'package:bohdan_bats_portfolio/desktop/drawer_desktop.dart';
import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

/// Desktop Experience: timeline layout, tech chips, summary stats (reference UI).
class ExperienceDesktop extends StatefulWidget {
  const ExperienceDesktop({super.key});

  @override
  State<ExperienceDesktop> createState() => _ExperienceDesktopState();
}

class _ExperienceDesktopState extends State<ExperienceDesktop> {
  @override
  Widget build(BuildContext context) {
    final experiences = <_ExperienceItem>[
      _ExperienceItem(
        role: 'Software Programming Teacher',
        company: 'Ivan Filipchak Sambir Vocational Pedagogical College',
        companyUrl: 'https://www.pedcollegesambir.org.ua/',
        imagePath: 'assets/college.png',
        period: '09.2025 – Present',
        employmentType: 'Part-time',
        description:
            'I teach future developers modern programming languages, approaches and technologies for creating production-grade apps.',
        techStack: 'C#, JS, CSS, HTML, Flutter, Blazor, EF Core',
      ),
      _ExperienceItem(
        role: 'Tech Lead & Founder & CEO',
        company: 'Own startup Principles',
        companyUrl: 'https://principles.top/',
        imagePath: 'assets/principles.png',
        period: '01.2023 – Present',
        employmentType: 'Side project',
        employmentDetail: 'For now, 1 hour per week',
        description:
            'My team develops "Principles: Habits for Goals" AI-related mobile app for iOS and Android.',
        techStack:
            'Azure, OpenAI, .NET MAUI, Flutter, ASP .NET Core, EF Core, Google Cloud, PostgreSQL, Docker, MVVM',
        achievements: [
          'The app was released on time',
          'It generates sufficient profit',
          'I created a platform consisting of five courses that teach programmers the necessary technologies',
          'Two programmers are already working at real IT companies',
        ],
      ),
      _ExperienceItem(
        role: 'Full Stack Engineer',
        company: 'Booksoft',
        companyUrl: 'https://test-pg.booksoft.com.ua/',
        imagePath: 'assets/booksoft.svg',
        period: '11.2022 – Present',
        employmentType: 'Full-time',
        techStack:
            'PostgreSQL, TypeScript, JavaScript, ASP .NET Core, HTML, CSS, LESS, C#, .NET MAUI, SQL Server, VueJS, Docker',
        achievements: [
          'Successfully implemented complex killer-feature',
          'Successfully developed MVP',
        ],
      ),
      _ExperienceItem(
        role: '.NET Developer',
        company: 'LightUpon.Cloud',
        companyUrl: 'https://lightup.cloud/',
        imagePath: 'assets/light_upon_cloud.png',
        period: '03.2021 – 04.2022',
        employmentType: 'Full-time',
        description:
            'Main engineer in the development of Windows file sharing app.',
        techStack: 'Docker, .NET Framework, WPF, C#',
        achievements: [
          'Successfully implemented my complex, multi-threading project Discovery Service',
          'I stabilized app work',
          'Published app on MS Store',
        ],
      ),
    ];

    final uniqueTechCount = _countUniqueTechnologies(experiences);
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
                  (i) => _TimelineEntry(
                    item: experiences[i],
                    isFirst: i == 0,
                    isLast: i == experiences.length - 1,
                  ),
                ),
                const SizedBox(height: 48),
                _SummaryBar(techDisplay: techDisplay),
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

  static int _countUniqueTechnologies(List<_ExperienceItem> items) {
    final set = <String>{};
    for (final item in items) {
      for (final part in item.techStack.split(',')) {
        final t = part.trim();
        if (t.isNotEmpty) {
          set.add(t);
        }
      }
    }
    return set.length;
  }
}

class _TimelineEntry extends StatelessWidget {
  final _ExperienceItem item;
  final bool isFirst;
  final bool isLast;

  const _TimelineEntry({
    required this.item,
    required this.isFirst,
    required this.isLast,
  });

  static const double _logoSize = 56;
  static const double _railWidth = 72;
  /// Vertical gap before the next entry; kept inside this row so the timeline
  /// rail’s line runs through it (no “cut” between icons).
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
                      child: Container(width: 2, color: AppConstants.borderColor),
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
                      _EmploymentBadge(label: item.employmentType),
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
                        child: _CompanyLink(
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
                    children: _techTags(item.techStack)
                        .map((tag) => _TechChip(label: tag))
                        .toList(),
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
                  if (!isLast)
                    const SizedBox(height: _spacingBeforeNextEntry),
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

  static List<String> _techTags(String techStack) {
    return techStack
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
  }
}

class _EmploymentBadge extends StatelessWidget {
  final String label;

  const _EmploymentBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: AppConstants.chipBackgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppConstants.borderColor),
      ),
      child: Text(
        label,
        style: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppConstants.textMutedColor,
        ),
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  final String label;

  const _TechChip({required this.label});

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

class _CompanyLink extends StatelessWidget {
  final String name;
  final String url;

  const _CompanyLink({
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(url);
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        },
        borderRadius: BorderRadius.circular(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                name,
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppConstants.linkColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppConstants.linkColor,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.open_in_new_rounded,
              size: 16,
              color: AppConstants.linkColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryBar extends StatelessWidget {
  final String techDisplay;

  const _SummaryBar({required this.techDisplay});

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
          const _SummaryColumn(
            value: '5+',
            label: 'Years Experience',
          ),
          Container(
            width: 1,
            height: 48,
            color: AppConstants.borderColor,
          ),
          const _SummaryColumn(
            value: '4',
            label: 'Companies',
          ),
          Container(
            width: 1,
            height: 48,
            color: AppConstants.borderColor,
          ),
          _SummaryColumn(
            value: techDisplay,
            label: 'Technologies',
          ),
        ],
      ),
    );
  }
}

class _SummaryColumn extends StatelessWidget {
  final String value;
  final String label;

  const _SummaryColumn({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.openSans(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppConstants.secondaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppConstants.textMutedColor,
          ),
        ),
      ],
    );
  }
}

class _ExperienceItem {
  final String role;
  final String company;
  final String companyUrl;
  final String imagePath;
  final String period;
  final String employmentType;

  /// Optional line under badge (e.g. hours per week).
  final String? employmentDetail;
  final String? description;
  final String techStack;
  final List<String> achievements;

  const _ExperienceItem({
    required this.role,
    required this.company,
    required this.companyUrl,
    required this.imagePath,
    required this.period,
    required this.employmentType,
    this.employmentDetail,
    this.description,
    required this.techStack,
    this.achievements = const [],
  });
}
