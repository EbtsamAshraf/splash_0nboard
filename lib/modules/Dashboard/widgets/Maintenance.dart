import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';

Widget buildMaintenanceSection() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Maintenance",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.greenLight,
              ),
            ),
            Icon(
              Icons.settings_outlined,
              color: AppColor.iconyellow,
              size: 22,
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          "Device Calibration Required",
          style: TextStyle(color: AppColor.font, fontWeight: FontWeight.w500, fontSize: 12),
        ),
        const SizedBox(height: 25),

        // الأجهزة المطلوبة
        _buildMaintenanceRow(
          "Prosthetic-G7 Unit",
          "HIGH PRIORITY",
          Colors.orange,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Divider(height: 1, color: Color(0xffF1F1F1)),
        ),
        _buildMaintenanceRow("M-Scan 2000", "SCHEDULED", Colors.blue),
      ],
    ),
  );
}

Widget _buildMaintenanceRow(String name, String status, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xff1A4D4D),
            ),
          ),
        ],
      ),
      Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    ],
  );
}
