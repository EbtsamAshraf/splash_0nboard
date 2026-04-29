import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_0nboard/modules/sing_up/view/showLoadingDialog.dart';
import '../../../core/route/app_route.dart';

class ProfessionalDetailsView extends StatelessWidget {
  const ProfessionalDetailsView({super.key});
  static final TextEditingController licenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7F9),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight - 40),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      _buildCustomHeader(),
                      const SizedBox(height: 10),
                      _buildStepIndicator(activeStep: 3),

                      const Spacer(flex: 1),

                      _buildPhotoSection(),

                      const Spacer(flex: 1),

                      _buildInputField(
                        "Medical License Number",
                        "e.g. 1234567890",
                        licenseController, // بعتنا الـ Controller هنا
                        icon: Icons.badge_outlined,
                      ),

                      const SizedBox(height: 20),

                      _buildDropdownField(
                        "Professional Specialty",
                        "Search and select specialty",
                      ),

                      const Spacer(flex: 1),

                      _buildVerificationNote(),

                      const Spacer(flex: 2),

                      _buildMainButton("Create Account", () {
                        if (licenseController.text.trim().isNotEmpty) {
                          showLoadingDialog();
                        } else {
                          Get.snackbar(
                            "Missing Info",
                            "Please enter your Medical License Number first",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.white,
                            colorText: Colors.red,
                            margin: const EdgeInsets.all(15),
                            icon: const Icon(Icons.warning_amber_rounded, color: Colors.red),
                          );
                        }
                      }),
                    ],
                  ),),)
            );
          },
        ),
      ),
    );
  }

  Widget _buildCustomHeader() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 22, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Professional Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff1A2530),
              ),
            ),
          ),
        ),
        const SizedBox(width: 48),
      ],
    );
  }

  Widget _buildStepIndicator({int activeStep = 1}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 1; i <= 3; i++)
          Container(
            width: i == 3 ? 40 : 30,
            height: 5,
            margin: const EdgeInsets.symmetric(horizontal: 2.5),
            decoration: BoxDecoration(
              color: activeStep >= i ? const Color(0xff88A787) : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
      ],
    );
  }

  Widget _buildPhotoSection() {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 52,
                backgroundColor: Colors.grey.shade100,
                child: Icon(Icons.person, size: 55, color: Colors.grey.shade400),
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: const Color(0xffE9E1B3),
                child: const Icon(Icons.add, size: 18, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Text(
          "Professional Photo",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xff1A2530)),
        ),
        const Text(
          "Optional: Add a photo for your profile",
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildInputField(String label, String hint, TextEditingController ctr, {IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff1A2530)),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: ctr,
            decoration: InputDecoration(
              prefixIcon: icon != null ? Icon(icon, size: 20, color: Colors.blueGrey.shade200) : null,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xff1A2530)),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Row(
                children: [
                  Icon(Icons.search, size: 20, color: Colors.blueGrey.shade200),
                  const SizedBox(width: 10),
                  Text(hint, style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
                ],
              ),
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              items: ["Cardiology", "Dentistry"].map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
              onChanged: (_) {},
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationNote() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xffE9F2F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.verified_user_outlined, size: 20, color: Color(0xff88A787)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "Your credentials will be verified by our medical board within 24 hours. This information is kept strictly confidential.",
              style: TextStyle(color: Colors.blueGrey.shade700, fontSize: 11, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainButton(String text, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Color(0xff88A787), Color(0xffE9E1B3)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff88A787).withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }}