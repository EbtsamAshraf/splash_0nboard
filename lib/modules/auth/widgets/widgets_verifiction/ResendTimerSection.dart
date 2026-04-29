import 'package:flutter/material.dart';

import '../../../../core/them/app_colors.dart';

class ResendTimerSection extends StatelessWidget {
  const ResendTimerSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.access_time, size: 18, color: AppColor.greColor),
            SizedBox(width: 5),
            Text("Resend code in ", style: TextStyle(color: AppColor.greColor)),
            Text("01:59", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Resend Code",
            style: TextStyle(
              color: AppColor.green,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class FooterTerms extends StatelessWidget {
  const FooterTerms({super.key});
  @override
  Widget build(BuildContext context) {
    return const Text(
      "By verifying, you agree to our Terms of Service and Privacy Policy",
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.grey, fontSize: 12),
    );
  }
}
