import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';

Widget buildDivider() {
  return Row(
    children: [
      const Expanded(child: Divider(color:AppColor.greyColor)),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text("or", style: TextStyle(color:AppColor.greyColor, fontSize: 16)),
      ),
      const Expanded(child: Divider(color: AppColor.greyColor)),
    ],
  );
}
