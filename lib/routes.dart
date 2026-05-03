import "package:bohdan_bats_portfolio/app/responsive_layout.dart";
import "package:bohdan_bats_portfolio/views/desktop/about_desktop.dart";
import "package:bohdan_bats_portfolio/views/desktop/blog_desktop.dart";
import "package:bohdan_bats_portfolio/views/desktop/contact_desktop.dart";
import "package:bohdan_bats_portfolio/views/desktop/experience_desktop.dart";
import "package:bohdan_bats_portfolio/views/desktop/landing_page_desktop.dart";
import "package:bohdan_bats_portfolio/views/desktop/projects_desktop.dart";
import "package:bohdan_bats_portfolio/views/mobile/about_mobile.dart";
import "package:bohdan_bats_portfolio/views/mobile/blog_mobile.dart";
import "package:bohdan_bats_portfolio/views/mobile/contact_mobile.dart";
import "package:bohdan_bats_portfolio/views/mobile/experience_mobile.dart";
import "package:bohdan_bats_portfolio/views/mobile/landing_page_mobile.dart";
import "package:bohdan_bats_portfolio/views/mobile/projects_mobile.dart";
import "package:flutter/material.dart";

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget responsive({required Widget desktop, required Widget mobile}) {
      return ResponsiveLayout(desktop: desktop, mobile: mobile);
    }

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => responsive(
            desktop: LandingPageDesktop(),
            mobile: LandingPageMobile(),
          ),
        );
      case "/contact":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              responsive(desktop: ContactDesktop(), mobile: ContactMobile()),
        );
      case "/about":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              responsive(desktop: AboutDesktop(), mobile: AboutMobile()),
        );
      case "/blog":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              responsive(desktop: BlogDesktop(), mobile: BlogMobile()),
        );
      case "/projects":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              responsive(desktop: ProjectsDesktop(), mobile: ProjectsMobile()),
        );
      case "/experience":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => responsive(
            desktop: ExperienceDesktop(),
            mobile: ExperienceMobile(),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => responsive(
            desktop: LandingPageDesktop(),
            mobile: LandingPageMobile(),
          ),
        );
    }
  }
}
