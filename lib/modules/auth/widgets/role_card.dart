import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const RoleCard({super.key, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 3),
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade100,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          ),
        ],
      ),
    );
  }
}
