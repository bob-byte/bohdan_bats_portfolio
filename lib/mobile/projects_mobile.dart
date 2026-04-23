import 'package:bohdan_bats_portfolio/components/animated_card.dart';
import 'package:bohdan_bats_portfolio/mobile/drawer_mobile.dart';
import 'package:flutter/material.dart';
import 'package:bohdan_bats_portfolio/imports.dart';

class ProjectsMobile extends StatefulWidget {
  const ProjectsMobile({super.key});

  @override
  State<ProjectsMobile> createState() => _ProjectsMobileState();
}

class _ProjectsMobileState extends State<ProjectsMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppConstants.surfaceColor,
        endDrawer: DrawerMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400,
                backgroundColor: AppConstants.surfaceColor,
                iconTheme: IconThemeData(size: 35, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset("assets/works.jpg", fit: .cover),
                ),
              ),
            ];
          },
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: .center,
                children: [
                  SizedBox(height: 20),
                  SansBold(text: "Works", size: 35),
                  SizedBox(height: 20),
                  AnimatedCard(
                    imagePath: "assets/portfolio_screenshot.png",
                    width: 300,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 30),
                  SansBold(text: "Portfolio", size: 20),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Sans(
                      text:
                          "Deployed on Android, iOS and Web, the potfolio project was truly an achievement. I used Flutter to develop the featuful and responsive UI and Firebase for the back-end.",
                      size: 15,
                    ),
                  ),
                  SizedBox(width: 20),
                  AnimatedCard(
                    youtubeWatchUrl:
                        'https://www.youtube.com/watch?v=0z0qm_XzecY',
                    width: 300,
                    height: 150,
                  ),
                  SizedBox(height: 30),
                  SansBold(text: 'Principles: Habits for Goals', size: 20),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Sans(
                      text:
                          'A habits and goals AI-powered companion built for Android and iOS. Tap the preview to open the walkthrough on YouTube — video plays in the browser or YouTube app.',
                      size: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
