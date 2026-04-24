import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/all_my_skills.dart';
import 'package:bohdan_bats_portfolio/components/animated_card.dart';
import 'package:bohdan_bats_portfolio/components/sans.dart';
import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/mobile/drawer_mobile.dart';
import 'package:flutter/material.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstants.surfaceColor,
        appBar: AppBar(
          backgroundColor: AppConstants.surfaceColor,
          elevation: 0,
          iconTheme: IconThemeData(
            size: 35,
            color: AppConstants.secondaryColor,
          ),
        ),
        endDrawer: DrawerMobile(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              //Introduction, first section
              CircleAvatar(
                radius: 117,
                backgroundColor: AppConstants.primaryColor,
                child: CircleAvatar(
                  radius: 113,
                  backgroundColor: AppConstants.secondaryColor,
                  child: CircleAvatar(
                    radius: 110,
                    backgroundColor: AppConstants.surfaceColor,
                    child: Image.asset(
                      "assets/portfolio_forth.png",
                      filterQuality: .high,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  children: [
                    SansBold(text: "About me", size: 35),
                    SizedBox(height: 10),
                    Sans(
                      text: AppConstants.introduction,
                      size: 15,
                      textAlign: .justify,
                    ),
                    SizedBox(height: 15),
                    AllMySkills(),
                  ],
                ),
              ),
              SizedBox(height: 40),

              //Web development, second section
              Column(
                crossAxisAlignment: .center,
                children: [
                  AnimatedCard(imagePath: "assets/webL.png", width: 200),
                  SizedBox(height: 30),
                  SansBold(text: "Web development", size: 20),
                  SizedBox(height: 10),
                ],
              ),
              Sans(
                text:
                    "I'm here to build your presence online with state of the art web apps",
                size: 15,
              ),

              //App development, third section
              Column(
                crossAxisAlignment: .center,
                children: [
                  AnimatedCard(
                    imagePath: "assets/app.png",
                    width: 200,
                    reverse: true,
                  ),
                  SizedBox(height: 30),
                  SansBold(text: "App development", size: 20),
                  SizedBox(height: 10),
                ],
              ),
              Sans(
                text:
                    "Do you need a high-preformance, responsive and beautiful app? Don't worry, I've got you covered.",
                size: 15,
              ),

              //Back-end development, forth section
              Column(
                crossAxisAlignment: .center,
                children: [
                  AnimatedCard(imagePath: "assets/asp_dotnet.png", width: 200),
                  SizedBox(height: 30),
                  SansBold(text: "Backend development", size: 20),
                  SizedBox(height: 10),
                ],
              ),
              Sans(
                text:
                    "Do you want your backend to be highly scalable and secure? Let's have a conversation on how I can help.",
                size: 15,
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
