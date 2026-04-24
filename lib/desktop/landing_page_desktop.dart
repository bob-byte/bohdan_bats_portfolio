import 'package:bohdan_bats_portfolio/components/all_my_skills.dart';
import 'package:bohdan_bats_portfolio/components/my_avatar.dart';
import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/components/animated_card.dart';
import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/desktop/all_desktop_tabs.dart';
import 'package:bohdan_bats_portfolio/desktop/contact_me_form_desktop.dart';
import 'package:bohdan_bats_portfolio/desktop/drawer_desktop.dart';
import 'package:flutter/material.dart';

import '../components/sans.dart';

class LandingPageDesktop extends StatefulWidget {
  const LandingPageDesktop({super.key});

  @override
  State<LandingPageDesktop> createState() => _LandingPageDesktopState();
}

class _LandingPageDesktopState extends State<LandingPageDesktop> {
  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;

    double appBarHeight = 56;

    return Scaffold(
      drawer: DrawerDesktop(),
      backgroundColor: AppConstants.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppConstants.surfaceColor,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 25.0,
          color: AppConstants.secondaryColor,
        ),
        title: AllDesktopTabs(),
      ),
      body: ListView(
        children: [
          //First page
          SizedBox(
            height: heightDevice - appBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppConstants.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: const SansBold(text: "Hello I'm", size: 15),
                    ),
                    SizedBox(height: 15),
                    SansBold(text: "Bohdan Bats", size: 55),
                    Sans(text: "Full-Stack developer", size: 30.0),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20),
                        Sans(text: "batsbohdan@gmail.com", size: 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 20),
                        Sans(text: "+380 (68) 93-179-72", size: 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20),
                        Sans(text: "Lviv region, Ukraine", size: 15),
                      ],
                    ),
                  ],
                ),
                MyAvatar(),
              ],
            ),
          ),

          //Second page
          SizedBox(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: .spaceEvenly,
              crossAxisAlignment: .center,
              children: [
                Flexible(
                  flex: 2,
                  child: Image.asset(
                    "assets/web.jpg",
                    height: heightDevice / 1.9,
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .center,
                    children: [
                      SansBold(text: "About me", size: 40),
                      SizedBox(height: 15),
                      Sans(
                        text:
                            "Hello! I'm Bohdan Bats. I specialize in full stack development",
                        size: 15,
                      ),
                      Sans(
                        text:
                            "I strive to ensure astounding performance with state of ",
                        size: 15,
                      ),
                      Sans(
                        text:
                            "the art security for Android, iOS, Windows, macOS and Web",
                        size: 15,
                      ),
                      SizedBox(height: 5),
                      AllMySkills(),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //Third section
          SizedBox(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: .spaceEvenly,
              children: [
                SansBold(text: "What I do?", size: 40),
                Row(
                  mainAxisAlignment: .spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/webL.png",
                      text: "WEB development",
                    ),
                    AnimatedCard(
                      imagePath: "assets/app.png",
                      text: "App development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePath: "assets/firebase.png",
                      text: "Back-end development",
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Forth section
          Container(height: heightDevice, child: ContactMeFormDesktop()),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
