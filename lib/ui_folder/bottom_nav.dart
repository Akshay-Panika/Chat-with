import 'package:chat_with/auth_folder/auth_screen.dart';
import 'package:chat_with/ui_folder/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import '../getx_controllers/bottomnav_getx_controller.dart';
import '../widget_folder/appbar_widget.dart';
import 'chat_screen.dart';
import 'home_screen.dart';

class BottomNav extends StatelessWidget {

  BottomNav({super.key,});

  final BottomNavGetXController bottomNavController = Get.put(BottomNavGetXController());

  final List<Widget> _screen = [
    HomeScreen(),
    ChatScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SafeArea(
       child: Column(
         children: [
           // User info row
            AppbarWidget(),
           
           Expanded(child: Obx(() => _screen[bottomNavController.selectedIndex.value],))
         ],
       ),
     ),


     // Bottom Navigation Bar
     bottomNavigationBar: MotionTabBar(
       tabBarHeight: 50,
       tabSize: 40,
       initialSelectedTab: "Home",
       labels: const ["Home", "Chat", "Profile"],
       icons: const [Icons.home, Icons.chat, Icons.person],
       textStyle: const TextStyle(color: Colors.black,fontSize: 13),
       tabSelectedColor: Colors.black54,
       tabIconColor: Colors.grey,
       onTabItemSelected: (int index) {
         // Handle tab switch logic
         bottomNavController.onSelectIndex(index);
       },
     ),
   );
  }
}
