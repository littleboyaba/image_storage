import 'package:get/get.dart';
import 'package:image_storage/controller/home_screen_controller.dart';
import 'package:image_storage/controller/splash_screen_controller.dart';
import 'package:image_storage/controller/upload_image_screen_controller.dart';

class BindingController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => UploadImageScreenController());
    Get.lazyPut(() => HomeScreenController());
  }

}