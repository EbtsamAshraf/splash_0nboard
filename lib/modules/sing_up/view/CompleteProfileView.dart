import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/them/app_colors.dart';
import '../Controller/CenterProfileController.dart';

class CompleteProfileView extends GetView<CenterProfileController> {
  const CompleteProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CenterProfileController());

    return Scaffold(
      backgroundColor: AppColor.faild,
      appBar: _buildCustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: _buildStepIndicator()),
            const SizedBox(height: 30),

            const Text(
              "Center Registration",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10),
            const Text(
              "Please provide the legal documentation and identification details for your medical facility.",
              style: TextStyle(color: AppColor.font, fontSize: 15),
            ),

            const SizedBox(height: 30),

            _buildCenterDataSection(controller),

            const SizedBox(height: 25),

            _buildDocumentsSection(),

            const SizedBox(height: 20),

            _buildInfoNote(),

            const SizedBox(height: 30),

            _buildMainButton("Save & Continue", () {
              print("Button Tapped!");
              controller.saveAndContinue();
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterDataSection(CenterProfileController controller) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.whitColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColor.faild,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInputField(
            "MEDICAL CENTER NAME",
            "e.g. Advanced Prosthetics Clinic",
            controller.centerNameController,
          ),
          _buildInputField(
            "TAX ID / COMMERCIAL REGISTRATION",
            "CR-XXXX-XXXX-XX",
            controller.taxIdController,
          ),
          _buildInputField(
            "INSTITUTIONAL ADDRESS",
            "Full street address, building, and city...",
            controller.addressController,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.whitColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Compliance Documents",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 15),
          _buildUploadCard(
            "Upload Accreditation Certificate",
            "PDF or JPEG (Max 5MB)",
            Icons.verified_user_outlined,
            iconColor: AppColor.iconyellow,
          ),
          const SizedBox(height: 14),
          _buildUploadCard(
            "Upload Operating License",
            "PDF or JPEG (Max 5MB)",
            Icons.assignment_outlined,
            iconColor: AppColor.iconyellow,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoNote() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.faild2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(Icons.info_outline, size: 24, color: AppColor.iconyellow),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "All documents are encrypted and stored according to medical data privacy standards.",
              style: TextStyle(color: AppColor.font, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildCustomAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.whitColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 20),
                  onPressed: () => Get.back(),
                ),
              ),
              const Center(
                child: Text(
                  "Complete Profile",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: AppColor.fontColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildStepIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: 40,
          height: 5,
          decoration: BoxDecoration(
            color: AppColor.green,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField(
    String label,
    String hint,
    TextEditingController ctr, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColor.fontColor,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: ctr,
            maxLines: maxLines,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.faild,
              hintText: hint,
              hintStyle: TextStyle(color: AppColor.font, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              contentPadding: const EdgeInsets.all(15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadCard(
    String title,
    String sub,
    IconData icon, {
    required Color iconColor,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            sub,
            style: const TextStyle(color: AppColor.greyColor, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildMainButton(String text, VoidCallback onTap) {
    return Center(
      child: Container(
        width: 280,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Color(0xff88A787), Color(0xffE9E1B3)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(15),
            splashColor: Colors.white.withOpacity(
              0.3,
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
