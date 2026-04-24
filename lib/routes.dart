import "package:bohdan_bats_portfolio/app/responsive_layout.dart";
import "package:bohdan_bats_portfolio/desktop/about_desktop.dart";
import "package:bohdan_bats_portfolio/desktop/blog_desktop.dart";
import "package:bohdan_bats_portfolio/desktop/contact_desktop.dart";
import "package:bohdan_bats_portfolio/desktop/experience_desktop.dart";
import "package:bohdan_bats_portfolio/desktop/landing_page_desktop.dart";
import "package:bohdan_bats_portfolio/desktop/projects_desktop.dart";
import "package:bohdan_bats_portfolio/mobile/about_mobile.dart";
import "package:bohdan_bats_portfolio/mobile/blog_mobile.dart";
import "package:bohdan_bats_portfolio/mobile/contact_mobile.dart";
import "package:bohdan_bats_portfolio/mobile/experience_mobile.dart";
import "package:bohdan_bats_portfolio/mobile/landing_page_mobile.dart";
import "package:bohdan_bats_portfolio/mobile/projects_mobile.dart";
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
