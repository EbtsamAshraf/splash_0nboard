import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/them/app_colors.dart';
import '../controllar/verificationcontroller.dart';
import '../widgets/OtpInputField.dart';
import '../widgets/widgets_verifiction/ResendTimerSection.dart';
import '../widgets/widgets_verifiction/Verificationicon.dart';
import '../widgets/widgets_verifiction/fotter_terms.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());

    return Scaffold(
      backgroundColor: AppColor.whitColor,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const VerificationIcon(), // ويدجت الأيقونة
              const SizedBox(height: 30),
              const VerificationHeader(), // ويدجت العناوين
              const SizedBox(height: 40),
              const OtpInputField(), // ويدجت مربعات الكود
              const SizedBox(height: 30),
              const ResendTimerSection(), // ويدجت التايمر
              const SizedBox(height: 60),
              const VerifyButton(), // ويدجت الزرار
              const SizedBox(height: 20),
              const FooterTerms(), // نص الشروط في الآخر
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      title: const Text(
        "Verification",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
