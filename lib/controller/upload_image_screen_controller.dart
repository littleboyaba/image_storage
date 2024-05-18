import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:image_storage/controller/home_screen_controller.dart';
import 'package:image_storage/screen/home_screen.dart';

class UploadImageScreenController extends GetxController {
  File? imagePath;
  double progressTime = 0.0;
  bool loading = false;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagePath = File(file.path);
      update();
    }
  }

  Future uploadImage() async {
    if (imagePath != null) {
      Get.defaultDialog(
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        title: "",
        content: const CircularProgressIndicator(),
      );
      final file = File(imagePath!.path);
      final metadata = SettableMetadata(contentType: "image/jpeg");
      final storageRef = FirebaseStorage.instance.ref();
      final uploadFile = storageRef
          .child("images/${DateTime.now().millisecondsSinceEpoch.toString()}")
          .putFile(file, metadata);
      uploadFile.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress = 100.0 *
                (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            progressTime = progress;
            update();
            break;
          case TaskState.paused:
            print("Upload is paused.");
            break;
          case TaskState.canceled:
            print("Upload is canceled.");
            break;
          case TaskState.error:
          // TODO: Handle this case.
            print("Upload has error!");
            break;
          case TaskState.success:
          // TODO: Handle this case.
            Get.back();
            Get.defaultDialog(
                title: 'Upload Status',
                content: const Text("Image Upload Successful"),
                actions: [
                  GetBuilder<HomeScreenController>(
                    builder: (controller) => TextButton(
                        onPressed: () {
                          controller.getPhoto();
                          Get.offAll(() => const HomeScreen());
                        },
                        child: GetBuilder<HomeScreenController>(
                          builder: (controller) => const Text("Ok"),
                        )),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Cancel")),
                ]);
            break;
        }
      });
      loading = false;
      update();
    } else {
      Get.defaultDialog(
          content: const Text("Please select a photo"),
          actions: [
            TextButton(onPressed: () => Get.back(), child: const Text("Ok")),
            TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
          ]
      );
    }
  }
}
