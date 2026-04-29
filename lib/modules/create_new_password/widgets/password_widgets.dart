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
                  color: AppColor.iconyellow,
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
class PasswordStrengthIndicator extends StatelessWidget {
  final double strength;
  const PasswordStrengthIndicator({required this.strength});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(5, (index) {
            return Expanded(
              child: Container(
                height: 6,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: index < (strength * 5) ? Colors.blue : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Icon(Icons.shield_outlined, size: 14, color: Colors.blue),
            SizedBox(width: 5),
            Text("Medical grade encryption applied", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        )
      ],
    );
  }
}
class RequirementText extends StatelessWidget {
  final String text;
  const RequirementText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: 8), child: Row(children: [
      const Icon(Icons.check_circle_outline, color: Colors.green, size: 18),
      const SizedBox(width: 8),
      Text(text, style: const TextStyle(color: Colors.green, fontSize: 13))
    ]));
  }
}