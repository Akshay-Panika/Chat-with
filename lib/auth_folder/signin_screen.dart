import 'package:chat_with/getx_controllers/signin_getx_controller.dart';
import 'package:chat_with/widget_folder/hw_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widget_folder/round_button_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SignInGetXController signInGetXController = Get.put(SignInGetXController());

  Future<void> setPhonePassword(String phone, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phone', phone);
    await prefs.setString('password', password);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
     body: SingleChildScrollView(
       child: Column(
        children: [
          50.height,

           const Padding(
             padding: EdgeInsets.only(left: 40.0,bottom: 40),
             child: Align(
               alignment: Alignment.centerLeft,
               child:Text("Sign In",style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
             ),
           ),
       
            Padding(
             padding: const EdgeInsets.all(40.0),
             child: Column(
               children: [
                 TextField(
                   controller: phoneController,
                   decoration: const InputDecoration(
                     labelText: 'User Id',
                     prefixIcon: Icon(Icons.person)
                 ),),
       
                 TextField(
                   controller: passwordController,
                   decoration: const InputDecoration(
                     labelText: 'Password',
                     prefixIcon: Icon(Icons.lock)
                 ),),
               ],
             ),
           ),
       
           Padding(
             padding:  const EdgeInsets.all(40.0),
             child: Column(
               children: [
                 Obx(() {
                   return  signInGetXController.isLoading.value
                       ? const Center(child: CircularProgressIndicator())
                       : roundButtonWidget(
                     text: "Sign In",
                     height: 50,width: double.infinity,
                     color: Colors.black87,
                     onTap: () {
                       final phone = phoneController.text.trim();
                       final password = passwordController.text.trim();

                       if (phone.isEmpty || password.isEmpty) {
                         Get.snackbar('Error', 'Fields cannot be empty');
                       } else {
                         signInGetXController.loginUser(phone, password);
                        // setPhonePassword(phone,password);
                       }
                     },
                   );
                 },
                 ),

                 Row(
                   children: [
                     const Text("Create a new account"),
                     10.width,
                     TextButton(onPressed: () {
                       Get.toNamed('/signup');
                     }, child:  Text("Sign Up",))
                   ],
                 ),
               ],
             ),
           )
       
         ],
       ),
     ),
    );
  }
}
