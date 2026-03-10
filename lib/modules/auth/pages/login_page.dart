import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/route/app_route.dart';
import '../../../core/them/app_colors.dart';
import '../controllar/login_controllar.dart';
import '../widgets/widgets_login/email_faild.dart';
import '../widgets/widgets_login/google_button.dart';
import '../widgets/widgets_login/login_header.dart';
import '../widgets/widgets_login/password_field.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitColor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginHeader(),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: AppColor.fontColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Login to your professional portal",
                    style: TextStyle(color: AppColor.greyColor, fontSize: 20),
                  ),

                  SizedBox(height: 30),

                  EmailField(),

                  SizedBox(height: 16),

                  PasswordField(),

                  SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.forgetPassword);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.blueColor,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: controller.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.blueColor,
                        shape: StadiumBorder(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColor.whitColor,
                            ),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  GoogleButton(),

                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: AppColor.greyColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          // انتقلي للمسار بتاع صفحة الـ Register
                          // تأكدي إنك معرفة '/register' في ملف app_route.dart
                          Get.toNamed(AppRoutes.register);                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
