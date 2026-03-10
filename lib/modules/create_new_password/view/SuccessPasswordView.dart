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
            icon: Icon(Icons.close, color: AppColor.blackColor),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/image/Hero Container.png'),

            const SizedBox(height: 40),

            const Text(
              "All Set!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColor.fontColor,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Your password has been successfully updated. Your account is now secure and ready to use.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.greyColor,
                fontSize: 18,
                height: 1.5,
              ),
            ),

            const Spacer(),

            // 3. زر العودة لتسجيل الدخول
            _buildActionButton(),
            const SizedBox(height: 20),

            // 4. رابط المساعدة
            TextButton(
              onPressed: () {},
              child: const Text(
                "Need help? Contact support",
                style: TextStyle(
                  color: AppColor.blueColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessIllustration() {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.shade50.withOpacity(0.5),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ظل دائري خلف الأيقونة
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff3b6ef5).withOpacity(0.1),
              ),
            ),
            // أيقونة الصح الزرقاء (أو حطي الصورة اللي في الديزاين)
            const Icon(Icons.check_circle, size: 100, color: Color(0xff3b6ef5)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    return SizedBox(
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
        onPressed: () =>
            Get.offAllNamed('/login'), // يرجع للوجن ويمسح كل اللي فات
        child: const Text(
          "Back to Login",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
