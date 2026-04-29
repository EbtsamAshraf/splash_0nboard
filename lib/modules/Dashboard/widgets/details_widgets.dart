import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';

// 1. الجزء العلوي (الحالة والعنوان والوصف)
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color:AppColor.bluelight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                "IN PROGRESS",
                style: TextStyle(
                  color: AppColor.greyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "REQ-2024-0892",
              style: TextStyle(color: AppColor.greyColor, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Text(
          "Broken carbon frame alignment in lower limb prosthesis",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            height: 1.2,
            color: AppColor.fontColor,
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "Structural integrity failure reported during high-intensity mobility exercise. Requires urgent assessment of the modular joint connection.",
          style: TextStyle(color: AppColor.greyColor, fontSize: 14, height: 1.5),
        ),
      ],
    );
  }
}

// 2. قسم الصور والتقييم الفني

// --- قسم الصور والتقييم الفني المحدث (نفس ديزاين فيجما) ---
class TechnicalAssessmentSection extends StatelessWidget {
  const TechnicalAssessmentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. قسم الصور (الرص الأفقي)
        Row(
          children: [
            // الصورة الكبيرة على اليسار
            Expanded(
              flex: 2,
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    // تأكدي من إضافة الصورة في الـ pubspec.yaml والمسار صح
                    image: AssetImage('assets/image/brok.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // العمود الصغير على اليمين (صورة وفيديو)
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  // الصورة الصغيرة العلوية
                  Container(
                    height: 105,
                    decoration: BoxDecoration(
                      color: const Color(0xffF1F5F9), // خلفية رمادية فاتحة احتياطية
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/image/bro.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // بوكس الفيديو (+2 Videos)
                  Container(
                    height: 105,
                    decoration: BoxDecoration(
                      color: const Color(0xff0F172A), // لون خلفية غامق (نفس فيجما)
                      borderRadius: BorderRadius.circular(20),
                      // اختياري: إضافة صورة خلفية باهتة للفيديو
                      image: DecorationImage(
                        image: const AssetImage('assets/image/video_thumbnail.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          AppColor.greColor.withOpacity(0.8), // تعتيم الصورة
                          BlendMode.srcOver,
                        ),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "+2 Videos",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 15), // مسافة بين الصور والبوكس الجديد

        // 2. البوكس الأبيض الجديد (Technical Assessment + Updated)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            // إضافة ظل خفيف جداً لإبراز البوكس الأبيض (نفس ديزاين فيجما)
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // العنوان على سطرين
              const Text(
                "Technical\nAssessment",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.2, // تظبيط المسافة بين السطرين
                  color: AppColor.fontColor,
                ),
              ),
              // الوقت على سطرين ومحاذاته لليمين
              const Text(
                "UPDATED 2H\nAGO",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: AppColor.greyColor, // لون رمادي فاتح
                  fontSize: 12,
                  height: 1.3,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// 3. حقل المعلومات (Date/Time)
class InfoField extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final bool isDropdown;
  const InfoField({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.isDropdown = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColor.greColor,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColor.boxColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18, color: AppColor.iconyellow),
              const SizedBox(width: 12),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColor.greyColor,
                ),
              ),
              if (isDropdown) ...[
                const Spacer(),
                const Icon(Icons.keyboard_arrow_down, color: AppColor.greyColor),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

// 4. بطاقة المريض المعدلة بالكامل (نفس البوكس والديزاين اللي طلبتيه)
class PatientDoctorCard extends StatelessWidget {
  const PatientDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffF8FAFC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffE2E8F0),
        ), // البوكس اللي طلبتيه
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(
                  'assets/image/bar.png',
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dr. Elias Thorne",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColor.fontColor,
                    ),
                  ),
                  Text(
                    "Active Patient Since 2021",
                    style: TextStyle(color: AppColor.greyColor, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          _buildDetailRow("Device Model", "Xenon Gen-5 Pro"),
          const Divider(height: 25, color:AppColor.greyColor , thickness: 1),
          _buildDetailRow("Last Clinic Visit", "Jan 12, 2024"),
          const Divider(height: 25, color: Color(0xffE2E8F0), thickness: 1),
          _buildDetailRow("Priority Level", "URGENT", isStatus: true),
          const SizedBox(height: 25),
          _buildHistoryButton(),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isStatus = false}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Color(0xff64748B), fontSize: 15),
          ),
          isStatus
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.orangColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1E293B),
                    fontSize: 14,
                  ),
                ),
        ],
      );

  Widget _buildHistoryButton() => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xffE2E8F0)),
    ),
    child: const Center(
      child: Text(
        "View Full Medical History",
        style: TextStyle(
          color: Color(0xff88A787), // اللون الأخضر بتاعك
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
  );
}
