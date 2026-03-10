import 'package:flutter/material.dart';

class StrengthIndicator extends StatelessWidget {
  const StrengthIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // السطر اللي فيه كلمة Strength و Excellent
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
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "EXCELLENT",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // المستطيلات الـ 5 الملونة
        Row(
          children: List.generate(5, (index) {
            return Expanded(
              child: Container(
                height: 5,
                margin: EdgeInsets.only(right: index == 4 ? 0 : 4),
                decoration: BoxDecoration(
                  // أول 4 مستطيلات لونهم أزرق بناءً على الديزاين
                  color: index < 4 ? const Color(0xff3b6ef5) : Colors.blue[100],
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
