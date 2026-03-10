import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:splash_0nboard/modules/auth/widgets/role_card.dart';
import 'package:splash_0nboard/modules/auth/widgets/user_role.dart';

import '../../../core/route/app_route.dart';
import '../../../core/them/app_colors.dart';

class RoleSelectionScreen extends StatefulWidget {
  static const String route = 'role_selection';
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.whitColor ,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            Image.asset("assets/image/splash.png", width: 200, height: 200),
            const Text(
              "Who Are You ?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.fontColor,
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              flex: 5,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 39,
                  crossAxisSpacing: 39,
                  childAspectRatio: 0.82,
                ),
                itemCount: UserRoleModel.roles.length,
                itemBuilder: (context, index) {
                  return RoleCard(
                    role: UserRoleModel.roles[index],
                    isSelected: selectedIndex == index,
                    onTap: () => setState(() => selectedIndex = index),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.greenColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: selectedIndex == null
                      ? null
                      : () {
                          Get.toNamed(AppRoutes.login);
                        },
                  child: const Text(
                    "Continue Button",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.whitColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
