import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    const Color greenDark = Color(0xff88A787);
    const Color greenLight = Color(0xffB5C3A6);
    const Color beige = Color(0xffE9E1B3);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [greenDark, greenLight, beige],
            begin: Alignment.centerLeft,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            isLast ? "Get Started" : "Next",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  const OnboardingIndicator({
    super.key,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final Color activeColor = const Color(0xffB5C2A9);
    final Color inactiveColor = const Color(0xffE0E0E0);
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: WormEffect(
        dotHeight: 10,
        dotWidth: 10,
        spacing: 5,
        dotColor: inactiveColor,
        activeDotColor: activeColor,
      ),
    );
  }
}
