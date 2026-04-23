import 'package:bohdan_bats_portfolio/desktop/tab_desktop.dart';
import 'package:flutter/material.dart';

class AllDesktopTabs extends StatelessWidget {
  const AllDesktopTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 3),
        TabDesktop(title: "Home", route: "/"),
        Spacer(),
        TabDesktop(title: "Experience", route: "/experience"),
        Spacer(),
        TabDesktop(title: "Projects", route: "/projects"),
        Spacer(),
        TabDesktop(title: "Blog", route: "/blog"),
        Spacer(),
        TabDesktop(title: "About", route: "/about"),
        Spacer(),
        TabDesktop(title: "Contact", route: "/contact"),
        Spacer(),
      ],
    );
  }
}
