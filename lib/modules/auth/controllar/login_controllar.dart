import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordHidden = true.obs;

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void login() {
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
  }
}
