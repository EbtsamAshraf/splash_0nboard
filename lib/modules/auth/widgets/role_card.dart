import 'package:flutter/material.dart';

import 'user_role.dart';

class RoleCard extends StatelessWidget {
  final UserRoleModel role;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.role,
    required this.isSelected,
    required this.onTap,
  });

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
              border: Border.all(
                color: isSelected ? role.color : Colors.transparent,
                width: 3,
              ),
            ),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade100,
              backgroundImage: AssetImage(role.image),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 100,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: role.color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              role.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
