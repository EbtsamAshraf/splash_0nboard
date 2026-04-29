import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';

class MaintenanceHeader extends StatelessWidget {
  const MaintenanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xff1A4D4D), // اللون الزيتي الغامق للوجو
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.medical_services,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Clinical Sanctuary",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.green,
                fontSize: 17,
              ),
            ),
          ],
        ),
        // أيقونة الإشعارات
        const Icon(
          Icons.notifications_none_outlined,
          size: 28,
          color:AppColor.iconyellow,
        ),
      ],
    );
  }
}