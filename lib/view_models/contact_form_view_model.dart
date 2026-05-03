import 'package:bohdan_bats_portfolio/components/add_data_firestore.dart';
import 'package:flutter/foundation.dart';

enum ContactFormStatus { initial, submitting, success, failure }

/// Presentation logic for the contact form (MVVM ViewModel).
class ContactFormViewModel extends ChangeNotifier {
  ContactFormViewModel({AddDataFirestore? repository})
      : _repository = repository ?? AddDataFirestore();

  final AddDataFirestore _repository;

  ContactFormStatus _status = ContactFormStatus.initial;
  String? _errorMessage;

  ContactFormStatus get status => _status;
  String? get errorMessage => _errorMessage;
  bool get isSubmitting => _status == ContactFormStatus.submitting;

  Future<void> submit({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String message,
  }) async {
    if (isSubmitting) return;
    _status = ContactFormStatus.submitting;
    _errorMessage = null;
    notifyListeners();

    final error = await _repository.addMessage(
      firstName,
      lastName,
      email,
      phone,
      message,
    );

    if (error == null) {
      _status = ContactFormStatus.success;
    } else {
      _status = ContactFormStatus.failure;
      _errorMessage = error;
    }
    notifyListeners();
  }

  void acknowledgeResult() {
    _status = ContactFormStatus.initial;
    _errorMessage = null;
    notifyListeners();
  }
}
