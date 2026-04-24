import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/add_data_firestore.dart';
import 'package:bohdan_bats_portfolio/components/app_dialogs.dart';
import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/components/text_form.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ContactMeFormMobile extends StatefulWidget {
  const ContactMeFormMobile({super.key});

  @override
  State<ContactMeFormMobile> createState() => _ContactMeFormMobileState();
}

class _ContactMeFormMobileState extends State<ContactMeFormMobile> {
  final _logger = Logger();
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
      child: Wrap(
        runSpacing: 20,
        spacing: 20,
        alignment: .center,
        children: [
          SansBold(text: "Contact me", size: 35),
          TextForm(
            text: "First Name",
            containerWidth: widthDevice / 1.4,
            hitText: "Please type first name",
            controller: _firstNameController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "First name is required";
              }
              return null;
            },
          ),
          TextForm(
            text: "Last Name",
            containerWidth: widthDevice / 1.4,
            hitText: "Please type last name",
            controller: _lastNameController,
          ),
          TextForm(
            text: "Email",
            containerWidth: widthDevice / 1.4,
            hitText: "Please type email address",
            controller: _emailController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Email is required";
              }
              return null;
            },
          ),
          TextForm(
            text: "Phone Number",
            containerWidth: widthDevice / 1.4,
            hitText: "Please type your phone number",
            controller: _phoneController,
          ),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.4,
            hitText: "Message",
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Message is required";
              }
              return null;
            },
          ),
          MaterialButton(
            onPressed: () async {
              if (_isSubmitting) return;

              _logger.d(_firstNameController.text);
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
            minWidth: widthDevice / 2.2,
            color: AppConstants.primaryColor,
            child: _isSubmitting
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: AppConstants.surfaceColor,
                    ),
                  )
                : SansBold(text: "Submit", size: 20),
          ),
        ],
      ),
    );
  }
}
