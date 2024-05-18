import 'package:get/get.dart';
import 'package:image_storage/screen/home_screen.dart';

class SplashScreenController extends GetxController {
  SplashScreenController() {splashLoadingStart();}

  static Future<void> splashLoadingStart() async {
    Future.delayed(
      const Duration(seconds: 2),
          () => Get.offAll(const HomeScreen()),
    );
  }
}
