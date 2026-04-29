import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_0nboard/core/them/app_colors.dart';
import '../controller/NavigationController.dart';
import '../view/MaintenanceView.dart';

Widget buildBottomNav() {
  // بنستخدم Get.find لو الـ Controller معمول له put قبل كدة، أو Get.put لو لسه
  final NavigationController controller = Get.put(NavigationController());

  return Container(
    decoration: BoxDecoration(
      color:AppColor.whitColor, // لازم لون عشان الظل يبان
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, -5),
        ),
      ],
    ),
    // الـ Obx لازم تغلف الـ BottomNavigationBar بالكامل
    child: Obx(() => BottomNavigationBar(
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        // ده السطر اللي بيشغل الزرار
        controller.changeIndex(index);      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 0, // بنخليها 0 لأننا حاطين الـ Shadow في الـ Container
      selectedItemColor: AppColor.green,
      unselectedItemColor: AppColor.font,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "HOME"),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "ORDERS"),
        BottomNavigationBarItem(icon: Icon(Icons.build_outlined), label: "MAINTENANCE"),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "MESSAGES"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "PROFILE"),
      ],
    )), // قفلة الـ Obx
  ); // قفلة الـ Container
}