import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/app_dialogs.dart';
import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/components/text_form.dart';
import 'package:bohdan_bats_portfolio/view_models/contact_form_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactMeFormDesktop extends StatefulWidget {
  const ContactMeFormDesktop({super.key});

  @override
  State<ContactMeFormDesktop> createState() => _ContactMeFormDesktopState();
}

class _ContactMeFormDesktopState extends State<ContactMeFormDesktop> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  ContactFormViewModel? _vm;

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

  void _onContactVmChanged() {
    final vm = _vm;
    if (vm == null) return;
    switch (vm.status) {
      case ContactFormStatus.success:
        _resetForm();
        AppDialogs.success(
          context,
          "Message sent",
          "Your message has been sent successfully",
        ).then((_) {
          if (mounted) vm.acknowledgeResult();
        });
        break;
      case ContactFormStatus.failure:
        final message = vm.errorMessage ?? 'Unknown error';
        AppDialogs.error(context, message).then((_) {
          if (mounted) vm.acknowledgeResult();
        });
        break;
      default:
        break;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final vm = context.read<ContactFormViewModel>();
    if (!identical(_vm, vm)) {
      _vm?.removeListener(_onContactVmChanged);
      _vm = vm;
      _vm!.addListener(_onContactVmChanged);
    }
  }

  @override
  void dispose() {
    _vm?.removeListener(_onContactVmChanged);
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    final vm = context.watch<ContactFormViewModel>();

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
            onPressed: vm.isSubmitting
                ? null
                : () {
                    final bool? isValid = _formKey.currentState?.validate();
                    if (isValid == true) {
                      context.read<ContactFormViewModel>().submit(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                            message: _messageController.text,
                          );
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
            child: vm.isSubmitting
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
