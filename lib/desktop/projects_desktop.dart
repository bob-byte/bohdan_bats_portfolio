import 'package:bohdan_bats_portfolio/components/animated_card.dart';
import 'package:bohdan_bats_portfolio/desktop/all_desktop_tabs.dart';
import 'package:bohdan_bats_portfolio/desktop/drawer_desktop.dart';
import 'package:flutter/material.dart';
import 'package:bohdan_bats_portfolio/imports.dart';

class ProjectsDesktop extends StatefulWidget {
  const ProjectsDesktop({super.key});

  @override
  State<ProjectsDesktop> createState() => _ProjectsDesktopState();
}

class _ProjectsDesktopState extends State<ProjectsDesktop> {
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawerDesktop(),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innterBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400,
              backgroundColor: AppConstants.surfaceColor,
              iconTheme: IconThemeData(size: 25, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/works.jpg",
                  fit: .cover,
                  filterQuality: .high,
                ),
              ),
              title: AllDesktopTabs(),
            ),
          ];
        },
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(height: 30),
                SansBold(text: "Projects", size: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedCard(
                        imagePath: "assets/portfolio_screenshot.png",
                        width: 300,
                        height: 200,
                      ),
                      SizedBox(width: widthDevice > 900 ? 48 : 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SansBold(text: "Portfolio", size: 30),
                            SizedBox(height: 15),
                            Sans(
                              text:
                                  "Deployed on Android, iOS and Web, the potfolio project was truly an achievement. I used Flutter to develop the featuful and responsive UI and Firebase for the back-end.",
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 56),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedCard(
                        youtubeWatchUrl:
                            'https://www.youtube.com/watch?v=0z0qm_XzecY',
                        width: 300,
                        height: 200,
                      ),
                      SizedBox(width: widthDevice > 900 ? 48 : 24),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SansBold(
                              text: 'Principles: Habits for Goals',
                              size: 30,
                            ),
                            SizedBox(height: 15),
                            Sans(
                              text:
                                  'A habits and goals AI-powered companion built for Android and iOS. Tap the preview to open the walkthrough on YouTube — video plays in the browser or YouTube app.',
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
