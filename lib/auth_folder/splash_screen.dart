import 'package:chat_with/widget_folder/hw_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../getx_controllers/splash_getx_controller.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashGetXController splashGetXController = Get.put(SplashGetXController());

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return   const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CircleAvatar(
             radius: 45,
             backgroundImage: AssetImage('assets/image/chatwithvideo.jpg'),
           ),
            Text("Chat With", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
