import 'package:chat_with/custom_widget/hw_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widget/round_button_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //backgroundColor: const Color(0xFF3a404e),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircleAvatar(radius: 40,
                backgroundImage: AssetImage('assets/image/chatwithvideo.jpg')
            ),


             /// Description part
             const Text("""
             
        Start 
                  Your 
                           Adventure""", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),


            /// Sign in sign up part
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                roundButtonWidget(
                    text: "Sign In",
                    height: 45,width: double.infinity,
                    color: Colors.black87,
                  onTap: () =>  Get.offNamed('/signIn'),
                ),
                20.height,

                Row(
                  children: [
                    const Text("Create a new account"),
                    10.width,
                    TextButton(onPressed: () {
                      Get.offNamed('/signup');
                    }, child:  Text("Sign Up",))
                  ],
                ),
              ],
            ),

            30.height,
          ],
        ),
      ),
    );
  }
}
