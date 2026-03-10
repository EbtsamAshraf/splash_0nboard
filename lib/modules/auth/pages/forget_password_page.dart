import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/route/app_route.dart';
import '../../../core/them/app_colors.dart';
import 'VerificationPage.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back, color: AppColor.blueColor),
                        SizedBox(width: 8),
                        Text(
                          "Back to Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.help_outline,
                    color: AppColor.blueColor,
                    size: 28,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Center(
                child: Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xffe7eefc),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/image/forget.png",
                      width: 140,
                      height: 140,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Center(
                child: Text(
                  "Forget password",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColor.fontColor,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Don't worry, enter your registered email to receive a recovery code.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "  Medical ID / Email",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.greyColor,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "smith@gmail.com",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor:AppColor.whitColor,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColor.greyColor,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  AppColor.blueColor,
                    elevation: 5,
                    shadowColor: AppColor.blueColor.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      Get.snackbar(
                        "تنبيه",
                        "يرجى كتابة البريد الإلكتروني أولاً",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor:AppColor.orangColor ,
                        colorText: AppColor.whitColor,
                      );
                    } else {
                      Get.to(() => const VerificationPage());
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Send Verification Code",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.whitColor,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, color:AppColor.whitColor),
                    ],
                  ),
                ),
              ),

              const Spacer(),

              Row(
                children: [
                  Expanded(
                    child: Divider(color: AppColor.greyColor, endIndent: 10),
                  ),
                  const Text(
                    "SECURE ACCESS",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      letterSpacing: 1.5,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey.shade300, indent: 10),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon(Icons.fingerprint),
                  const SizedBox(width: 25),
                  _buildSocialIcon(Icons.face),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(icon, size: 28, color: AppColor.blueColor),
    );
  }
}
