import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/them/app_colors.dart';

class SuccessPasswordView extends StatelessWidget {
  const SuccessPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitColor,
      appBar: AppBar(
        backgroundColor: AppColor.whitColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: AppColor.blackColor),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const Spacer(),

            Image.asset(
              'assets/image/Hero Container.png',
              height: 250,
            ),

            const SizedBox(height: 40),

            const Text(
              "All Set!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff1A2530),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Your password has been successfully updated. Your account is now secure and ready to use.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.font,
                fontSize: 20,
                height: 1.5,
              ),
            ),

            const Spacer(),

            // زر العودة لتسجيل الدخول بالتدرج اللوني
            _buildActionButton(),

            const SizedBox(height: 20),

            // رابط المساعدة
            TextButton(
              onPressed: () {},
              child: const Text(
                "Need help? Contact support",
                style: TextStyle(color: AppColor.textgreen, fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [AppColor.greenDark, AppColor.greenLight, AppColor.beige],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.greenDark.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
        onPressed: () => Get.offAllNamed('/login'),
        child: const Text(
          "Back to Login",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColor.whitColor,
          ),
        ),
      ),
    );
  }
}
