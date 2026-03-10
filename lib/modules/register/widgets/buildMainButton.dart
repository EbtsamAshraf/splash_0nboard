import 'package:flutter/material.dart';
import 'package:splash_0nboard/core/them/app_colors.dart';
import '../controllar/RegisterController.dart';

class BuildMainButton extends StatelessWidget {
  final RegisterController controller;

  const BuildMainButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () =>  controller.signUpWithEmail(),
        icon: const Icon(Icons.email_outlined, color: AppColor.whitColor),
        label: const Text(
          "Sign Up with Email",
          style: TextStyle(
            color: AppColor.whitColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
