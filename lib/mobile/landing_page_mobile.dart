import 'package:bohdan_bats_portfolio/components/all_my_skills.dart';
import 'package:bohdan_bats_portfolio/components/animated_card.dart';
import 'package:bohdan_bats_portfolio/components/my_social_media.dart';
import 'package:bohdan_bats_portfolio/components/sans.dart';
import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/text_form.dart';
import 'package:bohdan_bats_portfolio/mobile/contact_me_form_mobile.dart';
import 'package:bohdan_bats_portfolio/mobile/drawer_mobile.dart';
import 'package:bohdan_bats_portfolio/mobile/tab_mobile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  Container tealContainer(String text) {
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
      child: Text(text, style: GoogleFonts.openSans(fontSize: 15)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppConstants.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppConstants.surfaceColor,
        elevation: 0,
        iconTheme: IconThemeData(size: 35, color: AppConstants.secondaryColor),
      ),
      drawer: DrawerMobile(),
      body: ListView(
        children: [
          //Intro, first section
          CircleAvatar(
            radius: 117,
            backgroundColor: AppConstants.primaryColor,
            child: CircleAvatar(
              radius: 113,
              backgroundColor: AppConstants.secondaryColor,
              child: CircleAvatar(
                radius: 110,
                backgroundColor: AppConstants.surfaceColor,
                backgroundImage: AssetImage("assets/portfolio_second.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 25),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppConstants.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: SansBold(text: "Hello I'm", size: 15),
                    ),
                    SansBold(text: AppConstants.myFullName, size: 40),
                    SansBold(text: AppConstants.headLine, size: 20),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: .start,
                  spacing: 10,
                  children: [
                    Wrap(
                      spacing: 15,
                      direction: .vertical,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.call),
                        Icon(Icons.location_pin),
                      ],
                    ),
                    Wrap(
                      spacing: 15,
                      direction: .vertical,
                      children: [
                        Sans(text: "bac.bogdan222@gmail.com", size: 15),
                        Sans(text: "+380 (68) 93-179-72", size: 15),
                        Sans(text: "Lviv region, Ukraine", size: 15),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 90),

          //About me, Second section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                SansBold(text: "About me", size: 35),
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
          SizedBox(height: 60),

          //Third section: What I do
          Column(
            crossAxisAlignment: .center,
            children: [
              SansBold(text: "What I do?", size: 35),
              AnimatedCard(
                imagePath: "assets/webL.png",
                text: "Web development",
                width: 300,
              ),
              SizedBox(height: 35),
              AnimatedCard(
                imagePath: "assets/app.png",
                text: "App development",
                fit: BoxFit.contain,
                reverse: true,
                width: 300,
              ),
              SizedBox(height: 35),
              AnimatedCard(
                imagePath: "assets/firebase.png",
                text: "Back-end development",
                width: 300,
              ),
              SizedBox(height: 35),

              //Forth section: Contact
              ContactMeFormMobile(),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
