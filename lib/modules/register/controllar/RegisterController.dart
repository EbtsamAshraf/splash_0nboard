import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/route/app_route.dart';

class RegisterController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  void signUpWithEmail() {
    Get.toNamed(AppRoutes.completeProfile);
  }
  void signUpWithGoogle() => print("Google Auth");
  void signUpWithApple() => print("Apple Auth");
  void goToLogin() => Get.toNamed('/login');
}