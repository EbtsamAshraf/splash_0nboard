import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';
import '../controllar/RegisterController.dart';

Widget genderButton(String text, bool isSelected) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16),
      side: BorderSide(
        color: isSelected ? AppColor.greenLight : Colors.grey.shade200,
        width: isSelected ? 2 : 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: () {},
    child: Text(
      text,
      style: TextStyle(
        color: isSelected ? AppColor.greenLight : AppColor.blackColor,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget buildVerifiedBadge() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    decoration: BoxDecoration(
      color: AppColor.boxColor,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.grey.shade200, width: 1.5),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.verified_user_outlined,
          size: 20,
          color: AppColor.iconyellow,
        ),
        const SizedBox(width: 10),
        Text(
          "VERIFIED MEDICAL PLATFORM",
          style: TextStyle(
            color: Colors.blueGrey.shade800,
            fontSize: 12,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.8,
          ),
        ),
      ],
    ),
  );
}

class BuildLoginLink extends StatelessWidget {
  final RegisterController controller;

  const BuildLoginLink({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(color: AppColor.greyColor, fontSize: 16),
        ),
        TextButton(
          onPressed: () => controller.goToLogin(),
          child: const Text(
            "Login",
            style: TextStyle(
              color: AppColor.iconyellow,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildProfilePhoto() {
  return Center(
    child: Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xffF2F4F7),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, size: 50, color: Colors.grey),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Color(0xff3b6ef5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 20),
          ),
        ),
      ],
    ),
  );
}

Widget buildSocialButton({
  required String text,
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    height: 55,
    child: OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: AppColor.blackColor),
      label: Text(text, style: const TextStyle(color: AppColor.blackColor)),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        side: BorderSide(color: AppColor.greyColor,width: 1),
      ),
    ),
  );
}
