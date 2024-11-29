import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_screen/auth_screen.dart';
import 'auth_screen/signin_screen.dart';
import 'auth_screen/signup_screen.dart';
import 'auth_screen/splash_screen.dart';
import 'build_screen_folder/build_bottom_nav.dart';



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
        GetPage(name: '/bottomNav', page: () =>  BuildBottomNav(),),
      ],
    );
  }
}
