import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_storage/binding_controller.dart';
import 'package:image_storage/screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingController(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white24,
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          centerTitle: true,
          backgroundColor: Colors.black26,
        ),
        scaffoldBackgroundColor: const Color(0xff212922),
      ),
      title: "Firebase Storage",
      home: const SplashScreen(),
    );
  }
}
