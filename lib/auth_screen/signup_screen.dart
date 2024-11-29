import 'package:chat_with/custom_widget/hw_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../custom_widget/round_button_widget.dart';
import '../getx_controllers/signup_getx_controller.dart';
import '../models/user_model.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupGetXController signupGetXController = Get.put(SignupGetXController());
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isOtpSent = false.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.height,

            /// "New\nAccount",
            const Padding(
              padding: EdgeInsets.only(left: 40.0, bottom: 40),
              child: Text(
                "New\nAccount",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, height: 0.9 ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40.0,right: 40,top: 30),
              child: Row(
                children: [
                  const CircleAvatar(radius: 40,),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                          labelText: 'User Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Phone Number Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone_android),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical:0),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Enter Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),


            Obx(() => isOtpSent.value?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical:20),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Enter OTP',
                  prefixIcon: Icon(Icons.padding),
                ),
              ),
            ):const SizedBox()),

            /// Action Button (Send OTP or Verify OTP)
            20.height,
            Padding(
              padding:  const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Obx(() {
                    return signupGetXController.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : roundButtonWidget(
                      text: isOtpSent.value ? "Verify OTP" : "Send OTP",
                      height: 45,
                      width: double.infinity,
                      color: Colors.black87,
                      onTap: isOtpSent.value ? verifyOtp : sendOtp,
                    );
                  },
                  ),

                  20.height,
                  buildSignInRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  /// Sends OTP
  void sendOtp() {
    final username = userNameController.text.trim();
    final phone = phoneController.text.trim();

    if (username.isEmpty) {
      Get.snackbar('Error', 'Enter your username');
    } else if (phone.isEmpty || phone.length != 10) {
      Get.snackbar('Error', 'Enter a valid phone number');
    } else {
      signupGetXController.sendOtp('+91$phone');
      isOtpSent.value = true; // Switch to OTP verification mode
    }
  }

  /// Verifies OTP
  void verifyOtp() {
    final otp = otpController.text.trim();
    final name = userNameController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    if (otp.isEmpty || otp.length != 6) {
      Get.snackbar('Error', 'Please enter a valid 6-digit OTP.');
    } else {
      signupGetXController.verifyOtp(otp);
      final userModel = UserModel(
        userImage: '',
        userName: name,
        userPhone: phone,
        userPassword: password,
      );
      FirebaseFirestore.instance.collection('user').
      doc(phone).collection('userData').doc(phone).set(userModel.toMap());
      Get.offNamed('/signIn');
    }
  }

  /// Resends OTP
  void resendOtp() {
    final phone = phoneController.text.trim();
    if (phone.isNotEmpty) {
      signupGetXController.sendOtp('+91$phone');
      Get.snackbar('Info', 'OTP resent to your phone.');
    } else {
      Get.snackbar('Error', 'Phone number is missing. Please enter it again.');
    }
  }


  Widget buildSignInRow() {
    return Row(
      children: [
        const Text("I have an account"),
        10.width,
        TextButton(
          onPressed: () {
            Get.offNamed('/signIn');
          },
          child: const Text("Sign In"),
        ),
      ],
    );
  }
}
