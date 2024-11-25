import 'package:chat_with/widget_folder/hw_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget_folder/round_button_widget.dart';

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

             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Start", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                const Text("your", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const Text("adventure", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                60.height,
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                roundButtonWidget(
                    text: "Sign In",
                    height: 50,width: double.infinity,
                    color: Colors.black,
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
