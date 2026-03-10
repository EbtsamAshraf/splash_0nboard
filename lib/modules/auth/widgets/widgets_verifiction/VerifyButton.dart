import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/them/app_colors.dart';
import '../../controllar/verificationcontroller.dart';


class VerifyButton extends GetView<VerificationController> {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff3b6ef5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () => controller.verifyCode(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Verify",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.whitColor,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.check_circle_outline, color: AppColor.whitColor),
          ],
        ),
      ),
    );
  }
}
