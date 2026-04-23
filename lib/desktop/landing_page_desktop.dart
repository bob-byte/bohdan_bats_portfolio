import 'package:bohdan_bats_portfolio/components/my_avatar.dart';
import 'package:bohdan_bats_portfolio/components/my_social_media.dart';
import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/components/text_form.dart';
import 'package:bohdan_bats_portfolio/components/animated_card.dart';
import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/desktop/all_desktop_tabs.dart';
import 'package:bohdan_bats_portfolio/desktop/contact_me_form_desktop.dart';
import 'package:bohdan_bats_portfolio/desktop/drawer_desktop.dart';
import 'package:bohdan_bats_portfolio/desktop/tab_desktop.dart';
import 'package:flutter/material.dart';

import '../components/sans.dart';

class LandingPageDesktop extends StatefulWidget {
  const LandingPageDesktop({super.key});

  @override
  State<LandingPageDesktop> createState() => _LandingPageDesktopState();
}

class _LandingPageDesktopState extends State<LandingPageDesktop> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

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
                Image.asset("assets/web.jpg", height: heightDevice / 1.9),
                Column(
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
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(text: "Flutter", size: 15),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(text: ".NET MAUI", size: 15),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(text: "Clean Architecture", size: 15),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(text: "UI/UX", size: 15),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(text: "Databases", size: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(text: "TestFlight", size: 15),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(text: "Testing", size: 15),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(text: "REST API", size: 15),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(text: "Backend", size: 15),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(text: "AI Tools", size: 15),
                        ),
                        SizedBox(width: 7),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppConstants.primaryColor,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7.0),
                          child: Sans(text: "Security", size: 15),
                        ),
                      ],
                    ),
                  ],
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
          SizedBox(height: heightDevice, child: ContactMeFormDesktop()),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
