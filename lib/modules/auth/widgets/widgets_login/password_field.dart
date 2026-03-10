import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllar/login_controllar.dart';

class PasswordField extends StatelessWidget {

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {

    return Obx(() =>
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),

          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(30),
          ),

          child: TextField(
            controller: controller.passwordController,
            obscureText: controller.isPasswordHidden.value,

            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: const Icon(Icons.lock),

              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordHidden.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: controller.togglePassword,
              ),

              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
    );
  }
}