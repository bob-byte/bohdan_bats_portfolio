import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySkill extends StatelessWidget {
  final String _skill;

  const MySkill({required String skill, super.key}) : _skill = skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppConstants.primaryColor,
          style: BorderStyle.solid,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(7),
      child: Text(_skill, style: GoogleFonts.openSans(fontSize: 15)),
    );
  }
}
