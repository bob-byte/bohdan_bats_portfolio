import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/components/text_form.dart';
import 'package:flutter/material.dart';

class ContactMeFormMobile extends StatefulWidget {
  const ContactMeFormMobile({super.key});

  @override
  State<ContactMeFormMobile> createState() => _ContactMeFormMobileState();
}

class _ContactMeFormMobileState extends State<ContactMeFormMobile> {
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;

    return Wrap(
      runSpacing: 20,
      spacing: 20,
      alignment: .center,
      children: [
        SansBold(text: "Contact me", size: 35),
        TextForm(
          text: "First Name",
          containerWidth: widthDevice / 1.4,
          hitText: "Please type first name",
        ),
        TextForm(
          text: "Last Name",
          containerWidth: widthDevice / 1.4,
          hitText: "Please type last name",
        ),
        TextForm(
          text: "Email",
          containerWidth: widthDevice / 1.4,
          hitText: "Please type email address",
        ),
        TextForm(
          text: "Phone Number",
          containerWidth: widthDevice / 1.4,
          hitText: "Please type your phone number",
        ),
        TextForm(
          text: "Message",
          containerWidth: widthDevice / 1.4,
          hitText: "Message",
          maxLines: 10,
        ),
        MaterialButton(
          onPressed: () {},
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          minWidth: widthDevice / 2.2,
          color: AppConstants.primaryColor,
          child: SansBold(text: "Submit", size: 20),
        ),
      ],
    );
  }
}
