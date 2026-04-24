import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class AddDataFirestore {
  var logger = Logger();

  CollectionReference response = FirebaseFirestore.instance.collection(
    "messages",
  );

  Future<String?> addMessage(
    final String firstName,
    String lastName,
    final String email,
    final String phone,
    final String message,
  ) async {
    try {
      final value = await response
          .add({
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "phone": phone,
            "message": message,
          })
          .timeout(const Duration(seconds: 3));

      logger.d("Message added: $value");
      return null;
    } on TimeoutException catch (error) {
      logger.e("Error adding message (timeout): $error");
      return "Request timed out. Please check your internet connection.";
    } catch (error) {
      logger.e("Error adding message: $error");
      return error.toString();
    }
  }
}
