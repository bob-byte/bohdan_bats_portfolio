import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/add_data_firestore.dart';
import 'package:bohdan_bats_portfolio/components/app_dialogs.dart';
import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/components/text_form.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ContactMeFormDesktop extends StatefulWidget {
  const ContactMeFormDesktop({super.key});

  @override
  State<ContactMeFormDesktop> createState() => _ContactMeFormDesktopState();
}

class _ContactMeFormDesktopState extends State<ContactMeFormDesktop> {
  final logger = Logger();
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _clearControllers() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _messageController.clear();
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _clearControllers();
  }

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: .start,
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
                    controller: _firstNameController,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "First name is required";
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  TextForm(
                    text: "Last Name",
                    containerWidth: 350.0,
                    hitText: "Please enter last name",
                    controller: _lastNameController,
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
                    text: "Email",
                    containerWidth: 350.0,
                    hitText: "Please enter email",
                    controller: _emailController,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  TextForm(
                    text: "Phone number",
                    containerWidth: 350.0,
                    hitText: "Please enter your phone number",
                    controller: _phoneController,
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
            controller: _messageController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Message is required";
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          MaterialButton(
            onPressed: () async {
              if (_isSubmitting) return;

              final bool? isValid = _formKey.currentState?.validate();
              if (isValid == true) {
                setState(() {
                  _isSubmitting = true;
                });

                try {
                  var addData = AddDataFirestore();
                  String? messageError = await addData.addMessage(
                    _firstNameController.text,
                    _lastNameController.text,
                    _emailController.text,
                    _phoneController.text,
                    _messageController.text,
                  );

                  if (messageError == null) {
                    _resetForm();
                    if (context.mounted) {
                      await AppDialogs.success(
                        context,
                        "Message sent",
                        "Your message has been sent successfully",
                      );
                    }
                  } else {
                    if (context.mounted) {
                      await AppDialogs.error(context, messageError);
                    }
                  }
                } finally {
                  if (context.mounted) {
                    setState(() {
                      _isSubmitting = false;
                    });
                  }
                }
              }
            },
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 60,
            minWidth: 200,
            color: AppConstants.primaryColor,
            textColor: AppConstants.surfaceColor,
            child: _isSubmitting
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: AppConstants.surfaceColor,
                    ),
                  )
                : SansBold(text: "Send", size: 16),
          ),
        ],
      ),
    );
  }
}
