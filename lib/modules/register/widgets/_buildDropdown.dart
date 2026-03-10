import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';

Widget buildDropdown() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: AppColor.feaild,
      border: Border.all(color: AppColor.greyColor),
      borderRadius: BorderRadius.circular(12),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        hint: const Text(
          "Search and select specialty",
          style: TextStyle(color: AppColor.greyColor, fontSize: 16),
        ),
        icon: const Icon(Icons.keyboard_arrow_down, color: AppColor.greyColor),
        iconSize: 24,
        style: const TextStyle(),
        isExpanded: true,
        items: const [], // ضيفي التخصصات هنا لما تكوني جاهزة
        onChanged: (value) {},
      ),
    ),
  );
}
