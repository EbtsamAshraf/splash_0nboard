import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/them/app_colors.dart';
import '../../controllar/verificationcontroller.dart';

class VerificationIcon extends StatelessWidget {
  const VerificationIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xffe7eefc),
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Icon(
        Icons.mail_outline_rounded,
        size: 50,
        color: Color(0xff3b6ef5),
      ),
    );
  }
}

// 2. العناوين (نفس الخطوط والديزاين)
class VerificationHeader extends StatelessWidget {
  const VerificationHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Enter Verification Code",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.fontColor,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "We sent a 6-digit code to\nsarah.j***@healthcare.com",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16, height: 1.5),
        ),
      ],
    );
  }
}

class VerifyButton extends GetView<VerificationController> {
  const VerifyButton({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:  AppColor.blueColor,
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
