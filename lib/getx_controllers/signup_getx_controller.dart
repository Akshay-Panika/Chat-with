import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupGetXController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var verificationId = ''.obs;
  var isLoading = false.obs;

  /// Sends an OTP to the provided phone number.
  Future<void> sendOtp(String phoneNumber) async {
    try {
      isLoading(true);

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Automatically verifies the phone number.
          await _auth.signInWithCredential(credential);
          Get.snackbar('Success', 'Logged in automatically!');
        },
        verificationFailed: (FirebaseAuthException error) {
          // Handles errors like invalid phone numbers.
          Get.snackbar(
            'Error',
            error.message ?? 'Verification failed. Please try again.',
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          // When the OTP is successfully sent.
          this.verificationId.value = verificationId;
          Get.snackbar('OTP Sent', 'Check your phone for the OTP.');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handles timeout for auto-retrieval.
          this.verificationId.value = verificationId;
        },
      );
    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to send OTP: ${error.toString()}',
      );
    } finally {
      isLoading(false);
    }
  }

  /// Verifies the provided OTP.
  Future<void> verifyOtp(String otp) async {
    try {
      isLoading(true);

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      );

      await _auth.signInWithCredential(credential);
      Get.snackbar('Success', 'Account created successfully!');
    } catch (error) {
      Get.snackbar(
        'Error',
        'Invalid OTP. Please try again.',
      );
    } finally {
      isLoading(false);
    }
  }
}
