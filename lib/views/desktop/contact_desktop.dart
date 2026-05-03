import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/view_models/contact_form_view_model.dart';
import 'package:bohdan_bats_portfolio/views/desktop/all_desktop_tabs.dart';
import 'package:bohdan_bats_portfolio/views/desktop/contact_me_form_desktop.dart';
import 'package:bohdan_bats_portfolio/views/desktop/drawer_desktop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({super.key});

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
        body: SingleChildScrollView(
          child: ChangeNotifierProvider(
            create: (_) => ContactFormViewModel(),
            child: ContactMeFormDesktop(),
          ),
        ),
      ),
    );
  }
}
