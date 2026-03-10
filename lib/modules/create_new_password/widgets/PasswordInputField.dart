import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/them/app_colors.dart';
import '../controllar/CreatePasswordController.dart';

class PasswordInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final RxBool isVisible;

  const PasswordInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColor.greColor,
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => TextField(
            controller: controller,
            obscureText: !isVisible.value,
            // الجزء اللي بيشغل الـ Strength Bar
            onChanged: (value) {
              final createPasswordController =
                  Get.find<CreatePasswordController>();
              if (label == "New Password") {
                createPasswordController.validatePassword(value);
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade50,
              hintText: "SecurePass123!",
              hintStyle: const TextStyle(
                color: AppColor.greyColor,
                fontSize: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  isVisible.value ? Icons.visibility : Icons.visibility_off,
                  color: AppColor.greyColor,
                ),
                onPressed: () => isVisible.toggle(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
