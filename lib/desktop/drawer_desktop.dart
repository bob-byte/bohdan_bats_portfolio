import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/my_social_media.dart';
import 'package:flutter/material.dart';

class DrawerDesktop extends StatelessWidget {
  const DrawerDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppConstants.surfaceColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 72,
            backgroundColor: AppConstants.secondaryColor,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: AppConstants.surfaceColor,
              backgroundImage: AssetImage("assets/portfolio_fifth.png"),
            ),
          ),
          SizedBox(height: 45),
          MySocialMedia(),
        ],
      ),
    );
  }
}
