import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/my_social_media.dart';
import 'package:bohdan_bats_portfolio/mobile/tab_mobile.dart';
import 'package:flutter/material.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            DrawerHeader(
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: AppConstants.secondaryColor,
                  ),
                ),
                child: Image.asset("assets/portfolio_forth.png"),
              ),
            ),
            TabMobile(text: "Home", route: "/"),
            SizedBox(height: 20),
            TabMobile(text: "Experience", route: "/experience"),
            SizedBox(height: 20),
            TabMobile(text: "Projects", route: "/projects"),
            SizedBox(height: 20),
            TabMobile(text: "About", route: "/about"),
            SizedBox(height: 20),
            TabMobile(text: "Blog", route: "/blog"),
            SizedBox(height: 20),
            TabMobile(text: "Contact", route: "/contact"),
            SizedBox(height: 20),
            MySocialMedia(),
          ],
        ),
      ),
    );
  }
}
