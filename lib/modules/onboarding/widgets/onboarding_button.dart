import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';


class OnboardingButton extends StatelessWidget {
  final bool isLast;
  final VoidCallback onPressed;

  const OnboardingButton({
    super.key,
    required this.isLast,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.blueColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            isLast ?"Next" :"Get Started" ,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.whitColor,
            ),
          ),
        ),
      ),
    );
  }
}
