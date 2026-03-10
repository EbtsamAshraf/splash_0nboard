import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String body;
  final bool showLogo;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.body,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          if (showLogo)
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                "assets/image/splash.png",
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            )
          else
            const SizedBox(height: 120),

          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.08),
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const Spacer(flex: 1),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColor.fontColor,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              height: 1.5,
            ),
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }
}