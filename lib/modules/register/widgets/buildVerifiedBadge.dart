import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';

Widget buildVerifiedBadge() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: AppColor.whitColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.verified_user_outlined, size: 16, color: AppColor.greenColor),
        SizedBox(width: 8),
        Text(
          "VERIFIED MEDICAL PLATFORM",
          style: TextStyle(
            color: AppColor.blueColor,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
