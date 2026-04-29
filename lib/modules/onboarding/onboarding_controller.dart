import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // 1. تعريف الـ PageController (صح)
  final PageController pageController = PageController();

  // شيلنا سطر Get.find اللي كان عامل المشكلة هنا ❌

  var currentIndex = 0.obs;

  // عدد صفحات الـ Onboarding
  final int _totalPages = 3;

  void changePage(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    // التأكد إن الـ controller مربوط بالـ PageView قبل ما ينفذ
    if (pageController.hasClients) {
      if (currentIndex.value == _totalPages - 1) {
        goToSignUpChoice();
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void goToSignUpChoice() {
    // تأكدي إن الاسم ده مطابق للي في الـ AppRoutes
    Get.offAllNamed('/sign_up_choice');
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}