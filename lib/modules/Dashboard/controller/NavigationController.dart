import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:splash_0nboard/modules/Dashboard/MedicalCenterDashboard.dart';
import 'package:splash_0nboard/modules/Dashboard/view/MaintenanceDetailsView.dart';
import 'package:splash_0nboard/modules/sing_up/view/CompleteProfileView.dart';

import '../view/MaintenanceView.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  var isBarVisible = true.obs;

  // 1. ضيفي لستة الصفحات هنا بالترتيب
  final List<Widget> pages = [
     MedicalCenterDashboard(),     // index 0: الهوم
    const SizedBox(),                  // index 1
    const MaintenanceRequestsView(),   // index 2: شاشة "سارة ويلينجتون" (قائمة الطلبات)
    const SizedBox(),                  // index 3
    const CompleteProfileView(),       // index 4
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
    // Get.to مش مطلوبة هنا لأننا هنستخدم IndexedStack في الـ MainView
  }

  void updateBarVisibility(ScrollController scrollController) {
    if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (isBarVisible.value) isBarVisible.value = false;
    } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (!isBarVisible.value) isBarVisible.value = true;
    }
  }
}