import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/them/app_colors.dart';
import '../view/SuccessPasswordView.dart';

class CreatePasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  var isPasswordVisible = false.obs;
  var passwordStrength = 0.0.obs;

  void toggleVisibility() => isPasswordVisible.value = !isPasswordVisible.value;

  void validatePassword(String value) {
    double strength = 0.0;
    if (value.length >= 8) strength += 0.25;
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) strength += 0.25;
    if (value.contains(RegExp(r'[A-Z]'))) strength += 0.25;
    if (value.contains(RegExp(r'[0-9]'))) strength += 0.25;
    passwordStrength.value = strength;
  }

  void saveNewPassword() {
    String pass = passwordController.text.trim();
    String confirmPass = confirmController.text.trim();

    // التأكد إن الحقول مش فاضية وتطابق الباسوردين
    if (pass == confirmPass && pass.isNotEmpty) {
      if (passwordStrength.value < 0.75) {
        _showErrorSnackbar("Password is too weak!");
        return;
      }

      Get.to(() => const SuccessPasswordView());
    } else if (pass.isEmpty || confirmPass.isEmpty) {
      _showErrorSnackbar("Please fill in all fields");
    } else {
      _showErrorSnackbar("Passwords do not match!");
    }
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      "Alert",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.8),
      colorText: AppColor.whitColor,
      margin: const EdgeInsets.all(15),
    );
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmController.dispose();
    super.onClose();
  }
}
