import "package:bohdan_bats_portfolio/desktop/about_desktop.dart";
import "package:bohdan_bats_portfolio/desktop/blog_desktop.dart";
import "package:bohdan_bats_portfolio/desktop/contact_desktop.dart";
import "package:bohdan_bats_portfolio/desktop/landing_page_desktop.dart";
import "package:bohdan_bats_portfolio/desktop/projects_desktop.dart";
import "package:bohdan_bats_portfolio/mobile/blog_mobile.dart";
import "package:bohdan_bats_portfolio/mobile/contact_mobile.dart";
import "package:bohdan_bats_portfolio/mobile/about_mobile.dart";
import "package:bohdan_bats_portfolio/mobile/landing_page_mobile.dart";
import "package:bohdan_bats_portfolio/mobile/projects_mobile.dart";
import "package:flutter/material.dart";

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return LandingPageDesktop();
                } else {
                  return LandingPageMobile();
                }
              },
            ),
          );
        }

      case "/contact":
        {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return ContactDesktop();
                } else {
                  return ContactMobile();
                }
              },
            ),
          );
        }

      case "/about":
        {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return AboutDesktop();
                } else {
                  return AboutMobile();
                }
              },
            ),
          );
        }

      case "/blog":
        {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return BlogDesktop();
                } else {
                  return BlogMobile();
                }
              },
            ),
          );
        }

      case "/projects":
        {
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return ProjectsDesktop();
                } else {
                  return ProjectsMobile();
                }
              },
            ),
          );
        }

      default:
        {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  return LandingPageDesktop();
                } else {
                  return LandingPageMobile();
                }
              },
            ),
          );
        }
    }
  }
}
