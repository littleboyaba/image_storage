import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_storage/controller/upload_image_screen_controller.dart';

class UploadImageScreen extends StatelessWidget {
  const UploadImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          width: double.infinity,
          child: GetBuilder<UploadImageScreenController>(
            init: UploadImageScreenController(),
            initState: (_) {
              Get.find<UploadImageScreenController>().reactive;
            },
            builder: (imageData) => Column(
              children: [
                imageData.imagePath != null
                    ? SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      imageData.imagePath!,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                    : const Icon(
                  Icons.image,
                  color: Colors.white24,
                  size: 70,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: () {
                      imageData.pickImage();
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Select Image"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: () {
                      imageData.uploadImage();
                      if (imageData.loading) {
                        Get.defaultDialog(
                          title: '',
                          content: const CircularProgressIndicator(),
                        );
                      }
                    },
                    icon: const Icon(Icons.upload),
                    label: const Text("Upload"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
