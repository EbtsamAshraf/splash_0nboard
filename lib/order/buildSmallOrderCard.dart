// 1. تعديل الكارت الصغير ليقبل onTap
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../core/them/app_colors.dart';
import 'OrdersView.dart';

Widget _buildSmallOrderCard(String title, String count, IconData icon, {VoidCallback? onTap}) {
  return Expanded(
    child: GestureDetector( // استخدمنا GestureDetector كبديل أقوى
      onTap: () {
        print("Gesture Clicked!"); // للتأكد
        if (onTap != null) onTap();
      },
      behavior: HitTestBehavior.opaque, // دي بتجبر الـ Flutter يحس باللمسة في كل مساحة الكارت
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xff789376), size: 28),
            const SizedBox(height: 15),
            Text(count, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
            Text(title, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          ],
        ),
      ),
    ),
  );
}
// 2. تعديل الجريد لربط زرار New Orders
Widget buildOrdersGrid() {
  return Row(
    children: [
      // هنا ربطنا الكارت بصفحة الـ OrdersView الجديدة
      _buildSmallOrderCard(
        "New Orders",
        "12",
        Icons.assignment_outlined,
        onTap: () {
          print("تم الضغط على الزرار بنجاح!"); // شوفي الـ Debug Console بيطبع ده ولا لأ
          // تأكدي من عمل Import لملف OrdersView الجديد فوق
          Get.to(() => const OrdersView());
        },
      ),
      const SizedBox(width: 15),
      _buildSmallOrderCard("In Production", "08", Icons.precision_manufacturing_outlined),
    ],
  );
}