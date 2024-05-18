import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_storage/controller/home_screen_controller.dart';
import 'package:image_storage/screen/upload_image_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => const UploadImageScreen());
        },
        label: const Text(
          'Upload',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.upload,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),
      body: GetBuilder<HomeScreenController>(
        builder: (controller) => controller.photoList.isEmpty
            ?  const Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView.builder(
            itemCount: controller.photoList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 3,
                mainAxisSpacing: 5),
            itemBuilder: (context, index) => Card(
              child: GridTile(
                child: Image.network(
                  controller.photoList[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
