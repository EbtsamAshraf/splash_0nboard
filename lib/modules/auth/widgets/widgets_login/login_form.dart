import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/them/app_colors.dart';
import '../../controllar/login_controllar.dart';

// 1. حقل البريد الإلكتروني
class EmailField extends StatelessWidget {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            "Email Address",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff1A2530),
              fontSize: 14,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffF8FAFC),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: TextField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              hintText: "name@hospital.com",
              hintStyle: TextStyle(color: AppColor.font, fontSize: 14),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: AppColor.iconyellow,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordField extends StatelessWidget {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            "Password",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.fontColor,
              fontSize: 14,
            ),
          ),
        ),
        Obx(
          () => Container(
            decoration: BoxDecoration(
              color: const Color(0xffF8FAFC),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: TextField(
              controller: controller.passwordController,
              obscureText: controller.isPasswordHidden.value,
              decoration: InputDecoration(
                hintText: "••••••••",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: AppColor.iconyellow,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColor.iconyellow,
                  ),
                  onPressed: controller.togglePassword,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.greenDark, AppColor.greenLight, AppColor.beige],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.asset("assets/image/avatar.png", fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Step Again",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
