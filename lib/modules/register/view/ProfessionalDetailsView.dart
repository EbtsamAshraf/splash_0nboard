import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/route/app_route.dart';
import '../../../core/them/app_colors.dart';
import '../widgets/_buildDropdown.dart';
import '../widgets/buildProfilePhoto.dart';
import '../widgets/build_text_field.dart';
import 'LoadingDashboardView.dart';

class ProfessionalDetailsView extends StatelessWidget {
  const ProfessionalDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitColor,
      appBar: AppBar(
        backgroundColor: AppColor.whitColor,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColor.blackColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              "Professional Details",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.fontColor,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColor.boxColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 30,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColor.boxColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 30,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColor.blueColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            buildProfilePhoto(),
            const SizedBox(height: 15),
            const Text(
              "Professional Photo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Text(
              "Optional: Add a photo for your profile",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 30),
            buildTextField("Medical License Number", "e.g. 1234567890"),

            buildDropdown(),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffF0F5FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                children: [
                  Icon(Icons.verified_user, color: AppColor.blueColor),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Your credentials will be verified by our medical board within 24 hours. This information is keptstrictly confidential.",
                      style: TextStyle(fontSize: 16, color: Color(0xff3b6ef5)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Get.to(() => LoadingDashboardView(),);
                },
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                    color: AppColor.whitColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
