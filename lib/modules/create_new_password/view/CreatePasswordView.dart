import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/them/app_colors.dart';
import '../controllar/CreatePasswordController.dart';
import '../widgets/PasswordInputField.dart';
import '../widgets/RequirementText.dart';
import '../widgets/StrengthIndicator.dart';

class CreatePasswordView extends GetView<CreatePasswordController> {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitColor,
      appBar: AppBar(
        backgroundColor: AppColor.whitColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.blackColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Security",
          style: TextStyle(
            color: AppColor.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.history,
                color: AppColor.blueColor,
                size: 28,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Create new password",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.fontColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Your new password must be unique to your medical account and different from your previous passwords for enhanced safety.",
              style: TextStyle(
                color: AppColor.greyColor,
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 32),
            PasswordInputField(
              label: "New Password",
              controller: controller.passwordController,
              isVisible: controller.isPasswordVisible,
            ),

            const SizedBox(height: 16),
            const StrengthIndicator(),

            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.verified_user_outlined,
                  size: 16,
                  color: AppColor.blueColor,
                ),
                const SizedBox(width: 6),
                Text(
                  "Medical grade encryption applied",
                  style: TextStyle(color: AppColor.greColor, fontSize: 12),
                ),
              ],
            ),

            const SizedBox(height: 24),
            PasswordInputField(
              label: "Confirm New Password",
              controller: controller.confirmController,
              isVisible: controller.isPasswordVisible,
            ),

            const SizedBox(height: 24),
            const RequirementText(text: "At least 8 characters"),
            const RequirementText(text: "Includes a symbol (@#\$%)"),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3b6ef5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                onPressed: () => controller.saveNewPassword(),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Save Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.whitColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColor.whitColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                "Protected by 256-bit HIPAA compliance",
                style: TextStyle(color: AppColor.greyColor, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
