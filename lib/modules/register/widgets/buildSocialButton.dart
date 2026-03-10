import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';

Widget buildSocialButton(String text, IconData icon, VoidCallback onTap) {
  return SizedBox(
    width: double.infinity,
    height: 56,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColor.feaild, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        backgroundColor:AppColor.whitColor,
      ),
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: AppColor.blackColor),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              color: AppColor.fontColor,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    ),
  );
}