import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/components/text_form.dart';
import 'package:flutter/material.dart';

class ContactMeFormDesktop extends StatefulWidget {
  const ContactMeFormDesktop({super.key});

  @override
  State<ContactMeFormDesktop> createState() => _ContactMeFormDesktopState();
}

class _ContactMeFormDesktopState extends State<ContactMeFormDesktop> {
  @override
  Widget build(BuildContext context) {
    // double heightDevice = MediaQuery.of(context).size.height;
    double widthDevice = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: .spaceEvenly,
      children: [
        SansBold(text: "Contact me", size: 40),
        Row(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Column(
              children: [
                TextForm(
                  text: "First Name",
                  containerWidth: 350.0,
                  hitText: "Please enter your first name",
                ),
              ],
            ),
            Column(
              children: [
                TextForm(
                  text: "Last Name",
                  containerWidth: 350.0,
                  hitText: "Please enter last name",
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Column(
              children: [
                TextForm(
                  text: "Phone number",
                  containerWidth: 350.0,
                  hitText: "Please enter your phone number",
                ),
              ],
            ),
            Column(
              children: [
                TextForm(
                  text: "Email",
                  containerWidth: 350.0,
                  hitText: "Please enter email",
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        TextForm(
          text: "Message",
          containerWidth: widthDevice / 1.5,
          hitText: "Please enter message",
          maxLines: 10,
        ),
        MaterialButton(
          onPressed: () {},
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          minWidth: 200,
          color: AppConstants.primaryColor,
          textColor: AppConstants.surfaceColor,
          child: SansBold(text: "Send", size: 16),
        ),
      ],
    );
  }
}
