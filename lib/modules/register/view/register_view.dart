import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/route/app_route.dart';
import '../../../core/shared_combonent.dart';
import '../../../core/them/app_colors.dart';
import '../controllar/RegisterController.dart';
import '../widgets/register_widgets.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());

    const Color greenDark = Color(0xff88A787);
    const Color greenLight = Color(0xffB5C3A6);
    const Color beige = Color(0xffE9E1B3);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [greenDark, greenLight, beige],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
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
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 40),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildStepIndicator(isActive: true),
                          _buildStepIndicator(isActive: false),
                          _buildStepIndicator(isActive: false),
                        ],
                      ),
                      const SizedBox(height: 24),

                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1A2530),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Join thousands of verified application professionals managing care securely.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.greyColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 40),

                      BuildMainButton(
                        text: "Sign Up with Email",
                        icon: Icons.person_add_alt_1,
                          onPressed: () {
                            Get.toNamed(AppRoutes.completeProfile);
                          }
                      ),
                      const SizedBox(height: 24),

                      buildDivider(),
                      const SizedBox(height: 24),

                      buildSocialButton(
                        text: "Continue with Google",
                        icon: Icons.g_mobiledata,
                        onPressed: () => controller.signUpWithGoogle(),
                      ),

                      const SizedBox(height: 16),

                      buildSocialButton(
                        text: "Continue with Apple",
                        icon: Icons.apple,
                        onPressed: () => controller.signUpWithApple(),
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
      ),
    );
  }

  Widget _buildStepIndicator({required bool isActive}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 4,
      width: 35,
      decoration: BoxDecoration(
        color: isActive
            ? AppColor.greenLight
            : AppColor.beige,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
