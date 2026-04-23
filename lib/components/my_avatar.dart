import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  final String _imagePath;

  const MyAvatar({String imagePath = "assets/portfolio_second.png", super.key})
    : _imagePath = imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 147.0,
      backgroundColor: AppConstants.primaryColor,
      child: CircleAvatar(
        radius: 143.0,
        backgroundColor: AppConstants.secondaryColor,
        child: Container(
          padding: const EdgeInsets.all(0.0),
          child: CircleAvatar(
            radius: 140.0,
            backgroundColor: AppConstants.surfaceColor,
            foregroundImage: AssetImage(_imagePath),
          ),
        ),
      ),
    );
  }
}
