import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/route/app_route.dart';
import '../../../core/them/app_colors.dart';
import '../controllar/CompleteProfileController.dart';
import '../controllar/RegisterController.dart';
import '../widgets/_buildDropdown.dart';
import '../widgets/build_gender_selector.dart';
import '../widgets/build_text_field.dart';
import '../widgets/genderButton.dart';

class CompleteProfileView extends GetView<RegisterController>  {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitColor,
      appBar: AppBar(
        backgroundColor: AppColor.whitColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColor.blackColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Complete Profile",
          style: TextStyle(
            color: AppColor.fontColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "STEP 2 OF 3",
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                const Text(
                  "66% Complete",
                  style: TextStyle(
                    color: AppColor.blueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const LinearProgressIndicator(
                value: 0.66,
                minHeight: 6,
                backgroundColor: AppColor.greyColor,
                color: AppColor.blueColor,
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              "Personal Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.fontColor,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Please provide your official information as it appears on your medical credentials.",
              style: TextStyle(
                color: AppColor.greyColor,
                fontSize: 13,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 25),
            buildTextField(
              "Full Name",
              "Dr. Jane Smith",
              controller: controller.nameController,
            ),
            buildTextField(
              "Date of Birth",
              "MM/DD/YYYY",
              isDate: true,
              controller: controller.dateController,
            ),

            const Text(
              "Gender",
              style: TextStyle(fontSize: 16, color: AppColor.fontColor),
            ),
            const SizedBox(height: 12),
            buildGenderSelector(),

            const SizedBox(height: 20),
            const Text(
              "Medical Specialty",
              style: TextStyle(fontSize: 16, color: AppColor.fontColor),
            ),
            const SizedBox(height: 12),
            buildDropdown(),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  if (controller.nameController.text.isNotEmpty) {
                    // 2. لو البيانات موجودة، بننقل للصفحة اللي بعدها
                    Get.toNamed(AppRoutes.professionalDetails);
                  } else {
                    // 3. لو البيانات ناقصة، بنعرض رسالة للمستخدم
                    Get.snackbar(
                      "تنبيه",
                      "من فضلك أكمل البيانات الشخصية أولاً",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continue ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.whitColor,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: AppColor.whitColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "By continuing, you agree to our Terms of Service and\nPrivacy Policy regarding professional medical data.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColor.greyColor,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
