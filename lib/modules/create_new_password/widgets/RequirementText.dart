import 'package:flutter/material.dart';

class RequirementText extends StatelessWidget {
  final String text;
  const RequirementText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: 8), child: Row(children: [
      const Icon(Icons.check_circle_outline, color: Colors.green, size: 18),
      const SizedBox(width: 8),
      Text(text, style: const TextStyle(color: Colors.green, fontSize: 13))
    ]));
  }
}