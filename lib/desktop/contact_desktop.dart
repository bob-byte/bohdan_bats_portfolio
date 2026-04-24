import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/desktop/all_desktop_tabs.dart';
import 'package:bohdan_bats_portfolio/desktop/contact_me_form_desktop.dart';
import 'package:bohdan_bats_portfolio/desktop/drawer_desktop.dart';
import 'package:flutter/material.dart';

class ContactDesktop extends StatefulWidget {
  const ContactDesktop({super.key});

  @override
  State<ContactDesktop> createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerDesktop(),
      backgroundColor: AppConstants.surfaceColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innterBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 400,
              backgroundColor: AppConstants.surfaceColor,
              iconTheme: IconThemeData(size: 25, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: .cover,
                  filterQuality: .high,
                ),
              ),
              title: AllDesktopTabs(),
            ),
          ];
        },
        body: SingleChildScrollView(child: ContactMeFormDesktop()),
      ),
    );
  }
}
