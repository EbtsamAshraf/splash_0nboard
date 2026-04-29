import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/route/app_route.dart';

import '../onboarding_controller.dart';
import '../widgets/onboarding_widget.dart';
import 'onboarding_model.dart';
import '../../../../core/them/app_colors.dart';
import 'onbarding_page.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final OnboardingController controller = Get.put(OnboardingController());
  final pages = OnboardingModel.pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: pages.length,
                onPageChanged: controller.changePage,
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    image: pages[index].image,
                    title: pages[index].title,
                    body: pages[index].body,
                    showLogo: index == 0,
                  );
                },
              ),
            ),

            OnboardingIndicator(
              controller: controller.pageController,
              count: pages.length,
            ),

            const SizedBox(height: 30),

            Obx(
                  () => OnboardingButton(
                // الميكس والظل هيكونوا جوه الـ OnboardingButton نفسه (هعدلهولك تحت)
                isLast: controller.currentIndex.value == pages.length - 1,
                onPressed: () {
                  // نادي على nextPage وهي هتعرف لوحدها تقلب ولا تفتح الـ Login
                  controller.nextPage();
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
