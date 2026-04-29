import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'DashboardPage.dart';

class FinalFittingCompletedPage extends StatelessWidget {
  const FinalFittingCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text("Limbic Editorial",
            style: TextStyle(color: Color(0xff789376), fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        // لضمان وجود مساحة كافية للـ Stack العلوي
        clipBehavior: Clip.none,
        child: Column(
          children: [
            const SizedBox(height: 50), // مساحة لبروز الدائرة

            // 1. الجزء العلوي (علامة الصح العايمة + العناوين)
            _buildFloatingHeader(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  // 2. كارت المريض المنسق (نفس تقسيمة Figma)
                  _buildPatientDetailsCard(),

                  const SizedBox(height: 24),

                  // 3. كارت النتيجة الإكلينيكية (Gradient Card)
                  _buildClinicalConclusionCard(),

                  const SizedBox(height: 24),

                  // 4. القائمة السفلية (Reports)
                  _buildActionItem(Icons.description_outlined, "FINAL REPORT", "Download PDF Summary"),
                  _buildActionItem(Icons.lightbulb_outline, "COMPONENT SYNC", "Bio-Feedback Active"),
                  _buildActionItem(Icons.trending_up, "PERFORMANCE GAIT", "Optimized Level 4"),
                  _buildActionItem(Icons.chat_bubble_outline, "SUPPORT CHANNEL", "Transition to Aftercare"),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ميثود Header مع علامة الصح العايمة
  Widget _buildFloatingHeader() {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        // النصوص
        Column(
          children: [
            const SizedBox(height: 40),
            const Text("Final Fitting\nCompleted",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, height: 1.1, letterSpacing: -1)),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text("The clinical workflow for this patient has been successfully concluded. The prosthetic device is now fully operational and assigned.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.4)),
            ),
          ],
        ),
        // الدائرة الخضراء (العلامة)
        Positioned(
          top: -45, // لجعلها تبرز لأعلى
          child: Container(
            height: 85,
            width: 85,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [Color(0xffAFC8AE), Color(0xff789376)] // تدرج أخضر Figma
                ),
                boxShadow: [
                  BoxShadow(color: const Color(0xff789376).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))
                ]
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 45),
          ),
        ),
      ],
    );
  }

  // كارت تفاصيل المريض (التقسيمة الدقيقة)
  Widget _buildPatientDetailsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xffF8FAFC),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xffE2E8F0), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBadge("DELIVERED & ARCHIVED", const Color(0xffEEF2FF), const Color(0xff4338CA)),
              const Text("REF: LX-2024", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 20),
          const Text("PATIENT NAME", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const Text("Robert Miller", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xff1E293B))),
          const SizedBox(height: 4),
          const Text("Carbon-X Elite", style: TextStyle(color: Color(0xff789376), fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 25),
          const Divider(color: Color(0xffE2E8F0)),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: _infoTile("CLINIC HUB", "North Wing Hub")),
              Expanded(child: _infoTile("COMPLETION DATE", "Oct 24, 2023")),
            ],
          ),
          const SizedBox(height: 20),
          _infoTile("CASE STATUS", "Permanent Archive"),
        ],
      ),
    );
  }

  // كارت الـ Clinical Conclusion (الملون)
  Widget _buildClinicalConclusionCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xff789376), Color(0xff9DB29D)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Column(
        children: [
          const Text("Clinical Conclusion", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          Text("All calibration metrics meet the ISO-10328 standard. Mobility score increased by 42% since the initial assessment.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13, height: 1.5)),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child:ElevatedButton(
              onPressed: () {
                // الانتقال لصفحة الداشبورد باستخدام GetX
                Get.offAll(() => const DashboardPage());
                // استخدمنا offAll عشان نمسح الصفحات اللي فاتت من الـ Stack ويرجع كأنه لسه فاتح التطبيق
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xff789376),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Return to Dashboard", style: TextStyle(fontWeight: FontWeight.w900)),
            ),
          ),
        ],
      ),
    );
  }

  // ميثود العناصر القابلة للضغط في الأسفل
  Widget _buildActionItem(IconData icon, String label, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xffF8FAFC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: const Color(0xff789376), size: 22),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff334155))),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xff94A3B8)),
        ],
      ),
    );
  }

  // Widgets مساعدة لتقليل التكرار
  Widget _buildBadge(String text, Color bg, Color txt) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(100)),
    child: Text(text, style: TextStyle(color: txt, fontSize: 10, fontWeight: FontWeight.w800)),
  );

  Widget _infoTile(String label, String value) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
      const SizedBox(height: 4),
      Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xff1E293B))),
    ],
  );
}