import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bohdan_bats_portfolio/app_constants.dart';

class TabDesktop extends StatefulWidget {
  final String title;
  final String route;
  const TabDesktop({super.key, required this.title, required this.route});

  @override
  State<TabDesktop> createState() => _TabDesktopState();
}

class _TabDesktopState extends State<TabDesktop> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: _isSelected
              ? GoogleFonts.coda(
                  shadows: [
                    Shadow(
                      color: AppConstants.secondaryColor,
                      offset: Offset(0, -8),
                    ),
                  ],
                  color: Colors.transparent,
                  fontSize: 26.0,
                  decoration: .underline,
                  decorationThickness: 2,
                  decorationColor: AppConstants.primaryColor,
                )
              : GoogleFonts.coda(
                  color: AppConstants.secondaryColor,
                  fontSize: 23.0,
                ),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
