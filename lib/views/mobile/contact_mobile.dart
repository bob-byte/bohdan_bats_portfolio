import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/view_models/contact_form_view_model.dart';
import 'package:bohdan_bats_portfolio/views/mobile/contact_me_form_mobile.dart';
import 'package:bohdan_bats_portfolio/views/mobile/drawer_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactMobile extends StatelessWidget {
  const ContactMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: .cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: ChangeNotifierProvider(
            create: (_) => ContactFormViewModel(),
            child: ContactMeFormMobile(),
          ),
        ),
      ),
    );
  }
}
