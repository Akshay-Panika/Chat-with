
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashGetXController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome()async{
    await Future.delayed(const Duration(seconds: 3));

    FirebaseAuth.instance.currentUser != null ?
     Get.offNamed('/bottomNav'):
     Get.offNamed('/auth');
    //Get.offNamed('/auth');
  }
}