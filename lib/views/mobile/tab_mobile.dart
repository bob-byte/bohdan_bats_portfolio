import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bohdan_bats_portfolio/app_constants.dart';

class TabMobile extends StatefulWidget {
  final String text;
  final String route;
  const TabMobile({super.key, required this.text, required this.route});

  @override
  State<TabMobile> createState() => _TabMobileState();
}

class _TabMobileState extends State<TabMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      height: 50,
      minWidth: 200,
      elevation: 20,
      color: AppConstants.secondaryColor,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(
          fontSize: 20,
          color: AppConstants.surfaceColor,
        ),
      ),
    );
  }
}
