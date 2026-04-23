import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/all_my_skills.dart';
import 'package:bohdan_bats_portfolio/components/animated_card.dart';
import 'package:bohdan_bats_portfolio/components/my_avatar.dart';
import 'package:bohdan_bats_portfolio/components/my_social_media.dart';
import 'package:bohdan_bats_portfolio/components/sans.dart';
import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/desktop/all_desktop_tabs.dart';
import 'package:bohdan_bats_portfolio/desktop/drawer_desktop.dart';
import 'package:flutter/material.dart';

class AboutDesktop extends StatefulWidget {
  const AboutDesktop({super.key});

  @override
  State<AboutDesktop> createState() => _AboutDesktopState();
}

class _AboutDesktopState extends State<AboutDesktop> {
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 500,
              child: Row(
                mainAxisAlignment: .spaceAround,
                crossAxisAlignment: .center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .center,
                      children: [
                        SansBold(text: "About me", size: 40),
                        SizedBox(height: 15),
                        Sans(
                          text: AppConstants.introduction,
                          size: 15,
                          textAlign: .justify,
                        ),
                        SizedBox(height: 10),
                        AllMySkills(),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  MyAvatar(),
                ],
              ),
            ),
          ),

          //Web development, second section
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              AnimatedCard(imagePath: "assets/webL.png", height: 250),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(text: "Web development", size: 30),
                    SizedBox(height: 15),
                    SansBold(
                      text:
                          "I'm here to build your presence online with state of the art web apps.",
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          //App development, third section
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(text: "App development", size: 30),
                    SizedBox(height: 15),
                    SansBold(
                      text:
                          "Do you need a high-preformance, responsive and beautiful app? Don't worry, I've got you covered.",
                      size: 15,
                    ),
                  ],
                ),
              ),
              AnimatedCard(
                imagePath: "assets/app.png",
                height: 250,
                reverse: true,
              ),
            ],
          ),
          SizedBox(height: 20),

          //Back-end development, forth section
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              AnimatedCard(imagePath: "assets/asp_dotnet_2.png", height: 250),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold(text: "Backend development", size: 30),
                    SizedBox(height: 15),
                    SansBold(
                      text:
                          "Do you want your backend to be highly scalable and secure? Let's have a conversation on how I can help.",
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
