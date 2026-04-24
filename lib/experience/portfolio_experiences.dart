import 'package:bohdan_bats_portfolio/experience/experience_item.dart';

final List<ExperienceItem> portfolioExperiences = [
  ExperienceItem(
    role: 'Software Programming Teacher',
    company: 'Ivan Filipchak Sambir Vocational Pedagogical College',
    companyUrl: 'https://www.pedcollegesambir.org.ua/',
    imagePath: 'assets/college.png',
    period: '09.2025 – Present',
    employmentBadge: 'Part-time',
    description:
        'I teach future developers modern programming languages, approaches and technologies for creating production-grade apps.',
    techStack: 'C#, JS, CSS, HTML, Flutter, Blazor, EF Core',
  ),
  ExperienceItem(
    role: 'Tech Lead & Founder & CEO',
    company: 'Own startup Principles',
    companyUrl: 'https://principles.top/',
    imagePath: 'assets/principles.png',
    period: '01.2023 – Present',
    employmentBadge: 'Side project',
    employmentDetail: 'For now, 1 hour per week',
    mobileEmploymentChipOverride: '1 hour/week',
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
  ExperienceItem(
    role: 'Full Stack Engineer',
    company: 'Booksoft',
    companyUrl: 'https://test-pg.booksoft.com.ua/',
    imagePath: 'assets/booksoft.svg',
    period: '11.2022 – Present',
    employmentBadge: 'Full-time',
    techStack:
        'PostgreSQL, TypeScript, JavaScript, ASP .NET Core, HTML, CSS, LESS, C#, .NET MAUI, SQL Server, VueJS, Docker',
    achievements: [
      'Successfully implemented complex killer-feature',
      'Successfully developed MVP',
    ],
  ),
  ExperienceItem(
    role: '.NET Developer',
    company: 'LightUpon.Cloud',
    companyUrl: 'https://lightup.cloud/',
    imagePath: 'assets/light_upon_cloud.png',
    period: '03.2021 – 04.2022',
    employmentBadge: 'Full-time',
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
