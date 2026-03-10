import 'package:flutter/material.dart';

import '../../../../core/them/app_colors.dart';


class VerificationHeader extends StatelessWidget {
  const VerificationHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Enter Verification Code",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.fontColor,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "We sent a 6-digit code to\nsarah.j***@healthcare.com",
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColor.greyColor, fontSize: 16, height: 1.5),
        ),
      ],
    );
  }
}
