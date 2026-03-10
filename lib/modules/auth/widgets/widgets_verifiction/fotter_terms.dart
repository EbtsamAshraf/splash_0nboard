import 'package:flutter/material.dart';

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
