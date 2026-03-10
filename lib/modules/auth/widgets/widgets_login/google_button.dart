import 'package:flutter/material.dart';

import '../../../../core/them/app_colors.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),

      child: TextButton(
        onPressed: () {},

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.g_mobiledata, size: 32, color: AppColor.orangColor),

            SizedBox(width: 8),

            Text(
              "Continue with Google",
              style: TextStyle(
                fontSize: 16,
                color: AppColor.greColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
