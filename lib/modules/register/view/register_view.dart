import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/them/app_colors.dart';
import '../controllar/RegisterController.dart';
import '../widgets/buildMainButton.dart';
import '../widgets/buildSocialButton.dart';
import '../widgets/buildVerifiedBadge.dart';
import '../widgets/build_divider.dart';
import '../widgets/build_login_link.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
      backgroundColor: AppColor.blueColor,
      body: Column(
        children: [
          const SizedBox(height: 80),
          const Text(
            "Step Again",
            style: TextStyle(
              color: AppColor.whitColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "The standard in application",
            style: TextStyle(color: AppColor.whitColor, fontSize: 14),
          ),
          const SizedBox(height: 40),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: const BoxDecoration(
                color: AppColor.whitColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColor.fontColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Join thousands of verified application professionals managing care securely.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColor.greyColor, fontSize: 14),
                    ),
                    const SizedBox(height: 40),

                    BuildMainButton(controller: controller),
                    const SizedBox(height: 24),


                    const SizedBox(height: 24),

                    buildDivider(),
                    const SizedBox(height: 24),

                    buildSocialButton(
                      "Continue with Google",
                      Icons.g_mobiledata,
                      controller.signUpWithGoogle,
                    ),
                    const SizedBox(height: 16),
                    buildSocialButton(
                      "Continue with Apple",
                      Icons.apple,
                      controller.signUpWithApple,
                    ),

                    const SizedBox(height: 40),

                    BuildLoginLink(controller: controller),
                    const SizedBox(height: 20),

                    buildVerifiedBadge(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
