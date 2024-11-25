import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutGetXController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Logout function
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAllNamed('/auth'); // Navigate to the login screen after logout
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
