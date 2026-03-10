import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';

class LoadingDashboardView extends StatelessWidget {
  const LoadingDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الأيقونة اللي في النص
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xffE8F0FE),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shield_outlined,
                size: 50,
                color: AppColor.blueColor,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Preparing your medical\ndashboard...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Securing your health records",
              style: TextStyle(color: AppColor.greyColor, fontSize: 14),
            ),
            const SizedBox(height: 30),
            // الـ Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: LinearProgressIndicator(
                value: 0.65,
                color: AppColor.blueColor,
                minHeight: 5,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "SYNCHRONIZING   65%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColor.blueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
