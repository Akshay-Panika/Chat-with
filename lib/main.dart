import 'package:chat_with/auth_folder/signup_screen.dart';
import 'package:chat_with/ui_folder/bottom_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_folder/auth_screen.dart';
import 'auth_folder/signin_screen.dart';
import 'auth_folder/splash_screen.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () =>  SplashScreen(),),
        GetPage(name: '/auth', page: () =>  const AuthScreen(),),
        GetPage(name: '/signIn', page: () =>   SignInScreen(),),
        GetPage(name: '/signup', page: () =>   SignupScreen(),),
        GetPage(name: '/bottomNav', page: () =>  BottomNav(),),
      ],
    );
  }
}
