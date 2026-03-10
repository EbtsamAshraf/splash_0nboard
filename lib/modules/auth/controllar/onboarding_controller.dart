import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
