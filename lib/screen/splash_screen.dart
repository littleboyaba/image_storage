import 'package:flutter/material.dart';
import 'package:image_storage/controller/splash_screen_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            GetBuilder<SplashScreenController>(
              builder: (_) => const Text(
                "Firebase Storage",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Lottie.asset("assets/splashScreenLoader.json"),
          ],
        ),
      ),
    );
  }
}
