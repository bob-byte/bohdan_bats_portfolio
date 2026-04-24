import 'package:bohdan_bats_portfolio/app/app_breakpoints.dart';
import 'package:flutter/material.dart';

/// Picks [desktop] or [mobile] from [LayoutBuilder] constraints.
class ResponsiveLayout extends StatelessWidget {
  final Widget desktop;
  final Widget mobile;

  const ResponsiveLayout({
    super.key,
    required this.desktop,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > AppBreakpoints.desktopLayoutMinWidth) {
          return desktop;
        }
        return mobile;
      },
    );
  }
}
