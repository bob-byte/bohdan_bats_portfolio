import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/mobile/drawer_mobile.dart';
import 'package:flutter/material.dart';

class DefaultScaffoldMobile extends StatelessWidget {
  const DefaultScaffoldMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppConstants.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppConstants.surfaceColor,
        elevation: 0,
        iconTheme: IconThemeData(size: 35, color: AppConstants.secondaryColor),
      ),
      drawer: DrawerMobile(),
    );
  }
}
