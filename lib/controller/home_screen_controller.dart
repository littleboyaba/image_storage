import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeScreenController extends GetxController {
  HomeScreenController() {
    getPhoto();
  }

  List photoList = [];

  getPhoto() async {
    photoList.clear();
    final storageRef = FirebaseStorage.instance.ref().child("images/");
    final photoListResult = await storageRef.listAll();
    for (var item in photoListResult.items) {
      String url = await item.getDownloadURL();
      photoList.add(url);
    }
    update();
  }
}