import 'package:bohdan_bats_portfolio/imports.dart';
import 'package:bohdan_bats_portfolio/mobile/drawer_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

/// Mobile Experience: header, stat cards, expandable role rows (reference UI).
class ExperienceMobile extends StatefulWidget {
  const ExperienceMobile({super.key});

  @override
  State<ExperienceMobile> createState() => _ExperienceMobileState();
}

class _ExperienceMobileState extends State<ExperienceMobile> {
  int? _expandedIndex;

  static final List<_ExperienceItem> _experiences = [
    _ExperienceItem(
      role: 'Software Programming Teacher',
      company: 'Ivan Filipchak Sambir Vocational Pedagogical College',
      companyUrl: 'https://www.pedcollegesambir.org.ua/',
      imagePath: 'assets/college.png',
      period: '09.2025 – Present',
      employmentChip: 'Part-time',
      description:
          'I teach future developers modern programming languages, approaches and technologies for creating production-grade apps.',
      techStack: 'C#, JS, CSS, HTML, Flutter, Blazor, EF Core',
    ),
    _ExperienceItem(
      role: 'Tech Lead & Founder & CEO',
      company: 'Principles',
      companyUrl: 'https://principles.top/',
      imagePath: 'assets/principles.png',
      period: '01.2023 – Present',
      employmentChip: '1 hour/week',
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
      employmentChip: 'Full-time',
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
      employmentChip: 'Full-time',
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

  @override
  Widget build(BuildContext context) {
    final uniqueTechCount = _countUniqueTechnologies(_experiences);
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
          _StatsRow(techDisplay: techDisplay),
          const SizedBox(height: 20),
          ...List.generate(
            _experiences.length,
            (i) => Padding(
              padding: EdgeInsets.only(
                bottom: i < _experiences.length - 1 ? 12 : 0,
              ),
              child: _ExpandableExperienceCard(
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

class _StatsRow extends StatelessWidget {
  final String techDisplay;

  const _StatsRow({required this.techDisplay});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.calendar_today_outlined,
            value: '5+',
            label: 'Years',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatCard(
            icon: Icons.business_outlined,
            value: '4',
            label: 'Companies',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatCard(
            icon: Icons.layers_outlined,
            value: techDisplay,
            label: 'Technologies',
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
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

class _ExpandableExperienceCard extends StatelessWidget {
  final _ExperienceItem item;
  final bool expanded;
  final VoidCallback onHeaderTap;

  const _ExpandableExperienceCard({
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
                          _CompanyInlineLink(
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
                              _EmploymentChip(label: item.employmentChip),
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
            secondChild: _ExpandedBody(item: item),
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

class _CompanyInlineLink extends StatelessWidget {
  final String name;
  final String url;

  const _CompanyInlineLink({
    required this.name,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final uri = Uri.parse(url);
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      },
      child: Row(
        children: [
          Flexible(
            child: Text(
              name,
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppConstants.secondaryColor,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.open_in_new_rounded,
            size: 16,
            color: AppConstants.linkColor,
          ),
        ],
      ),
    );
  }
}

class _EmploymentChip extends StatelessWidget {
  final String label;

  const _EmploymentChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppConstants.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppConstants.borderColor),
      ),
      child: Text(
        label,
        style: GoogleFonts.openSans(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppConstants.textMutedColor,
        ),
      ),
    );
  }
}

class _ExpandedBody extends StatelessWidget {
  final _ExperienceItem item;

  const _ExpandedBody({required this.item});

  @override
  Widget build(BuildContext context) {
    final tags = item.techStack
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: AppConstants.borderColor,
          ),
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
                  .map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppConstants.surfaceColor,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: AppConstants.borderColor),
                      ),
                      child: Text(
                        tag,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppConstants.secondaryColor,
                        ),
                      ),
                    ),
                  )
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

class _ExperienceItem {
  final String role;
  final String company;
  final String companyUrl;
  final String imagePath;
  final String period;
  final String employmentChip;
  final String? description;
  final String techStack;
  final List<String> achievements;

  const _ExperienceItem({
    required this.role,
    required this.company,
    required this.companyUrl,
    required this.imagePath,
    required this.period,
    required this.employmentChip,
    this.description,
    required this.techStack,
    this.achievements = const [],
  });
}
