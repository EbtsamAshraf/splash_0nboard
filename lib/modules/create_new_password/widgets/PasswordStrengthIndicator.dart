import 'package:flutter/material.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final double strength;
  const PasswordStrengthIndicator({required this.strength});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(5, (index) {
            return Expanded(
              child: Container(
                height: 6,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: index < (strength * 5) ? Colors.blue : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Icon(Icons.shield_outlined, size: 14, color: Colors.blue),
            SizedBox(width: 5),
            Text("Medical grade encryption applied", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        )
      ],
    );
  }
}