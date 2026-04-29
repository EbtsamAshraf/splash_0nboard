import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Dashboard/MedicalCenterDashboard.dart';

void showLoadingDialog() {
  Get.dialog(
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(0.9), // الخلفية البيضاء الشفافة
    Center(
      // Material هنا عشان يشيل أي خطوط صفراء تحت التكست ويظبط الثيم
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: MediaQuery.of(Get.context!).size.width * 0.8, // واخد 80% من عرض الشاشة
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25), // زوايا مستديرة ناعمة
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // ظل خفيف جداً
                blurRadius: 20, // انتشار الظل
                spreadRadius: 5, // مدى بروز الظل
                offset: const Offset(0, 10), // الظل نازل لتحت شوية بيدي إحساس بالبروز
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Checking Data",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff88A787),
                  fontFamily: 'Poppins', // لو مستخدمة فونت معين
                ),
              ),
              const SizedBox(height: 40),

              // اللودينج الشيك
              const SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffE9E1B3)),
                  backgroundColor: Color(0xffF5F5F5), // خلفية خفيفة للدايرة
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                "Wait 1 minute To Check Your Data",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
  Future.delayed(const Duration(seconds: 3), () {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    Get.offAll(() => const MedicalCenterDashboard());
  });Future.delayed(const Duration(seconds: 3), () {
    if (Get.isDialogOpen!) {
      Get.back();
    }
    Get.offAll(() => const MedicalCenterDashboard());
  });
}