import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/them/app_colors.dart';
import '../auth/pages/VerificationPage.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // شريط التنقل العلوي
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back, color: AppColor.greenDark),
                        SizedBox(width: 8),
                        Text(
                          "Back to Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.greenDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: AppColor.whitebeige,
                    radius: 20,
                    child: Icon(
                      Icons.help_outline,
                      color: AppColor.iconyellow,
                      size: 24,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Center(
                child: Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xffe7eefc).withOpacity(0.5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/image/forget.png",
                      width: 160,
                      height: 160,
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
                      color: AppColor.font,
                      fontSize: 18,
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
                  color: AppColor.fontColor,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "smith@gmail.com",
                  hintStyle: const TextStyle(color: AppColor.font),
                  filled: true,
                  fillColor: const Color(0xffF8FAFC),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColor.greenLight,
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

              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                    colors: [
                      AppColor.greenDark,
                      AppColor.greenLight,
                      AppColor.beige,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.greenDark.withOpacity(0.2),
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
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      Get.snackbar(
                        "Alert",
                        "Please enter your email first",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
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
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // الفاصل السفلي
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "SECURE ACCESS",
                      style: TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.5,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Icon(icon, size: 28, color: AppColor.greenLight),
    );
  }
}
