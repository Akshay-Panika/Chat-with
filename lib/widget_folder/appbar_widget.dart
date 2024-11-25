import 'package:chat_with/widget_folder/hw_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({super.key});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {

  String? getPhone;
  String? getPassword;

  Future<void> getPhonePassword(String phone, String password) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      getPhone = prefs.getString('phone');
      getPassword = prefs.getString('password');
    });

  }

  @override
  Widget build(BuildContext context) {
    print(getPhone);
    return  Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Row(
            children: [
              const CircleAvatar(
                radius: 20,
                child: Icon(Icons.image, color: Colors.black54,),
              ),

              10.width,
                Column(
                children: [
                  const Text("Akshay Panika", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  Text(getPhone.toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.black54,),
          ),
        ],
      ),
    );
  }
}
