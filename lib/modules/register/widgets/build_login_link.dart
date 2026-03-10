import 'package:flutter/material.dart';
import '../../../core/them/app_colors.dart';
import '../controllar/RegisterController.dart';

class BuildLoginLink extends StatelessWidget {
  final RegisterController controller;

  const BuildLoginLink({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(color: AppColor.greyColor),
        ),
        TextButton(
          onPressed: () => controller.goToLogin(),
          child: const Text(
            "Login",
            style: TextStyle(
              color:AppColor.blueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}