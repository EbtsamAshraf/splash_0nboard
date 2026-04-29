import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/them/app_colors.dart';
import '../Controller/RoleController.dart';

class RoleView extends GetView<RoleController> {
  RoleView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RoleController());

    return Scaffold(
      backgroundColor: AppColor.whitColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              Image.asset(
                'assets/image/logo.png',
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,

                child: const Text(
                  "Who Are You ?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.fontColor,
                  ),
                ),
              ),

              const SizedBox(height: 60),

              Obx(
                () => Column(
                  children: [
                    _buildRoleCard(
                      title: "Center",
                      icon: Icons.add_home_work_outlined,
                      isSelected: controller.selectedRole.value == 'Center',
                      onTap: () => controller.selectRole('Center'),
                    ),
                    const SizedBox(height: 60),

                    _buildRoleCard(
                      title: "Patient",
                      icon: Icons.person_outline_rounded,
                      isSelected: controller.selectedRole.value == 'Patient',
                      onTap: () => controller.selectRole('Patient'),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [AppColor.greenDark, AppColor.greenLight],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () => controller.proceed(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.greenLight,
                    shadowColor: AppColor.greenDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "continue button",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 283,
        height: 52,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSelected
                ? [AppColor.greenDark, AppColor.green, AppColor.greenLight]
                : [AppColor.greenLight, AppColor.beige],

            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),

              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : AppColor.greenDark,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
