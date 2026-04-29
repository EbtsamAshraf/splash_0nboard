import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:splash_0nboard/core/them/app_colors.dart';

import '../../../core/route/app_route.dart';
import '../../onboarding/pages/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(AppRoutes.onboarding);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ZoomIn(
              duration: const Duration(seconds: 1),
              child: Image.asset("assets/image/logo.png"),
            ),
          ),

          Spin(
            duration: const Duration(seconds: 2),
            child: Image.asset("assets/image/loading-circles.png"),
          ),

          //   CircularProgressIndicator(strokeWidth: 3, color: AppColor.blueColor),
        ],
      ),
    );
  }
}
