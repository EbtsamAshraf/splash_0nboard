import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/them/app_colors.dart';
import '../controllar/verificationcontroller.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) => _buildPinBox(context)),
    );
  }

  Widget _buildPinBox(BuildContext context) {
    final controller = Get.find<VerificationController>();
    return Container(
      width: 45,
      height: 55,
      decoration: BoxDecoration(
        color: AppColor.whitColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1) {
            controller.otpCode.value += value;
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
