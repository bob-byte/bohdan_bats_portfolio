/// Single role row for desktop and mobile Experience screens.
class ExperienceItem {
  final String role;
  final String company;
  final String companyUrl;
  final String imagePath;
  final String period;

  /// Desktop: pill next to the role title.
  final String employmentBadge;

  /// Optional second line under the desktop pill (e.g. hours per week).
  final String? employmentDetail;

  /// Mobile row chip; when null, [employmentBadge] is used.
  final String? mobileEmploymentChipOverride;
  final String? description;
  final String techStack;
  final List<String> achievements;

  const ExperienceItem({
    required this.role,
    required this.company,
    required this.companyUrl,
    required this.imagePath,
    required this.period,
    required this.employmentBadge,
    this.employmentDetail,
    this.mobileEmploymentChipOverride,
    this.description,
    required this.techStack,
    this.achievements = const [],
  });

  String get mobileEmploymentChip =>
      mobileEmploymentChipOverride ?? employmentBadge;
}

int countUniqueTechnologies(List<ExperienceItem> items) {
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

List<String> parseTechStack(String techStack) {
  return techStack
      .split(',')
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty)
      .toList();
}
