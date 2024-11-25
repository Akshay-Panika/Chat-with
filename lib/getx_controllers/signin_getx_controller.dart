import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInGetXController extends GetxController {
  // Reactive variable to control loading state
  var isLoading = false.obs;

  Future<void> loginUser(String phone, String password) async {
    // Start loading
    isLoading.value = true;

    try {
      // Fetch user document from Firestore
      final userDoc = await FirebaseFirestore.instance
          .collection('user')
          .doc(phone)
          .collection('userData')
          .doc(phone)
          .get();

      if (userDoc.exists) {
        // Access user data
        final userData = userDoc.data();
        if (userData?['userPassword'] == password) {
          Get.offNamed('/bottomNav'); // Navigate to the main screen
        } else {
          Get.snackbar('Error', 'Incorrect password.');
        }
      } else {
        Get.snackbar('Error', 'User not found.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Login failed: $e');
    } finally {
      // Stop loading
      isLoading.value = false;
    }
  }
}
