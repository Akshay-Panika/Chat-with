import 'package:chat_with/auth_folder/auth_screen.dart';
import 'package:chat_with/widget_folder/hw_widget.dart';
import 'package:chat_with/widget_folder/round_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx_controllers/logout_getx_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  
  final LogoutGetXController logoutGetXController = Get.put(LogoutGetXController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(padding: const EdgeInsets.all(15),
                  child: roundButtonWidget(
                    text: 'Edit Your Account',
                    height:30,
                    color: Colors.black54,)),
            ),
            IconButton(onPressed: (){
              logoutGetXController.logout();
            }, icon: const Icon(Icons.logout)),
            5.width
          ],
        ),

        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("299"),
                Text("Post",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),

            Column(
              children: [
                Text("299"),
                Text("Post",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),

            Column(
              children: [
                Text("299"),
                Text("Post",style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
        Divider(),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing:20,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return const Card(
                  elevation: 0.0,
                  color: Colors.black12,);
                },),
          ),
        )
      ],
    );
  }
}
