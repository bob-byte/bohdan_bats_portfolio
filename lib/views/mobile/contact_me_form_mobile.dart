import 'package:bohdan_bats_portfolio/app_constants.dart';
import 'package:bohdan_bats_portfolio/components/app_dialogs.dart';
import 'package:bohdan_bats_portfolio/components/sans_bold.dart';
import 'package:bohdan_bats_portfolio/components/text_form.dart';
import 'package:bohdan_bats_portfolio/view_models/contact_form_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactMeFormMobile extends StatefulWidget {
  const ContactMeFormMobile({super.key});

  @override
  State<ContactMeFormMobile> createState() => _ContactMeFormMobileState();
}

class _ContactMeFormMobileState extends State<ContactMeFormMobile> {
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
            minWidth: widthDevice / 2.2,
            color: AppConstants.primaryColor,
            child: vm.isSubmitting
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
