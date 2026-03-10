import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';

Widget buildTextField(String label, String hint, {bool isDate = false,TextEditingController? controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: AppColor.fontColor,
        ),
      ),
      const SizedBox(height: 8),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColor.greyColor, fontSize: 14),
          filled: true,
          fillColor: AppColor.feaild,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColor.feaild, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color:AppColor.blueColor, width: 1.5),
          ),
          suffixIcon: isDate
              ? const Icon(Icons.calendar_today, size: 20, color: AppColor.greyColor)
              : null,
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}
