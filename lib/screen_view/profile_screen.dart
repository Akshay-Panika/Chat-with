import 'package:chat_with/custom_widget/hw_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom_widget/round_button_widget.dart';
import '../getx_controllers/logout_getx_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  
  final LogoutGetXController logoutGetXController = Get.put(LogoutGetXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat With"),
        backgroundColor: Colors.transparent,),
      body: Column(
        children: [

          Container(
            height: 80,
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                const CircleAvatar(radius: 40,),
                20.width,
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("User Id"),
                    Text("Akshay Panika"),
                  ],
                ),
              ],
            ),
          ),

          0.height,
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
          20.height,

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
      ),
    );
  }
}
