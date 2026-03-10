import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllar/login_controllar.dart';

class EmailField extends StatelessWidget {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),

      child: TextField(
        controller: controller.emailController,

        decoration: const InputDecoration(
          labelText: "Email Address",
          hintText: "name@hospital.com",
          prefixIcon: Icon(Icons.email),

          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
