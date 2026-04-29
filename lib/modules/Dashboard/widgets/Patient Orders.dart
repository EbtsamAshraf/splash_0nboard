import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/them/app_colors.dart';
import '../../../order/OrdersView.dart';

Widget buildOrdersGrid() {
  return Row(
    children: [
      // كارت New Orders مربوط بصفحة الأوامر
      _buildSmallOrderCard(
        "New Orders",
        "12",
        Icons.assignment_outlined,
        onTap: () {
          print("تم الضغط وفتح صفحة الأوامر!");
          Get.to(() => const OrdersView());
        },
      ),
      const SizedBox(width: 15),
      _buildSmallOrderCard("In Production", "08", Icons.precision_manufacturing_outlined),
    ],
  );
}

Widget _buildSmallOrderCard(String title, String count, IconData icon, {VoidCallback? onTap}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(4),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        child: InkWell(
          onTap: onTap, // هنا الربط السحري
          borderRadius: BorderRadius.circular(20),
          splashColor: AppColor.green.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: AppColor.iconyellow, size: 28),
                const SizedBox(height: 15),
                Text(count,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColor.green)),
                Text(title,
                    style: const TextStyle(
                        fontSize: 13,
                        color: AppColor.greyColor)),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}