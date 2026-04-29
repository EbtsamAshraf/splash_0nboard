import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/them/app_colors.dart';
import '../../controllar/verificationcontroller.dart';

// 1. أيقونة البريد (بداخل دائرة التدرج)
class VerificationIcon extends StatelessWidget {
  const VerificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [AppColor.greenDark, AppColor.greenLight, AppColor.beige],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Icon(
        Icons.mail_outline_rounded,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}

class VerificationHeader extends StatelessWidget {
  const VerificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Enter Verification Code",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff1A2530),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "We sent a 6-digit code to\nsarah.j***@healthcare.com",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColor.textgreen,
            fontSize: 16,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class VerifyButton extends GetView<VerificationController> {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [AppColor.greenDark, AppColor.greenLight, AppColor.beige],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.greenDark.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () => controller.verifyCode(),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verify",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.check_circle_outline, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

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
