import 'package:flutter/material.dart';
import '../../../core/them/app_colors.dart'; // تأكدي من مسار ملف الألوان بتاعك

class StrengthIndicator extends StatelessWidget {
  const StrengthIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Security Strength",
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColor.greenLight.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "EXCELLENT",
                style: TextStyle(
                  color: AppColor.greenDark,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(5, (index) {
            return Expanded(
              child: Container(
                height: 5,
                margin: EdgeInsets.only(right: index == 4 ? 0 : 4),
                decoration: BoxDecoration(
                  color: index < 4
                      ? AppColor.green
                      : AppColor.greenLight.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
