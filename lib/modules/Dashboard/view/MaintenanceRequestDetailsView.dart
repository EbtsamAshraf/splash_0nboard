import 'package:flutter/material.dart';
import 'package:get/get.dart';
// تأكدي من عمل import للـ widgets اللي إنتي كريتيها

class MaintenanceRequestDetailsView extends StatelessWidget {
  const MaintenanceRequestDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Header مع رقم الطلب
            _buildOrderTitle(),
            const SizedBox(height: 25),
            // الوصف الفني
            _buildTechnicalSection(),
            const SizedBox(height: 25),
            // صور الحالة (الأطراف)
            _buildPatientSubmission(),
            const SizedBox(height: 25),
            // ملاحظة الطبيب
            _buildClinicalNoteSection(),
            const SizedBox(height: 25),
            // الأدوات المطلوبة
            _buildToolsSection(),
            const SizedBox(height: 40),
            // الزرار الأخير
            _buildStartRepairButton(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // --- الـ Widgets الفرعية بناءً على الديزاين الجديد ---

  PreferredSizeWidget _buildAppBar() => AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 20),
      onPressed: () => Get.back(),
    ),
    title: const Text("Clinical Sanctuary",
        style: TextStyle(color: Color(0xff789376), fontWeight: FontWeight.bold, fontSize: 18)),
    centerTitle: true,
  );

  Widget _buildOrderTitle() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("MAINTENANCE REQUEST", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      const Text("#MT-9920", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
      const SizedBox(height: 12),
      Row(
        children: [
          _tag("In-Queue", const Color(0xffE0E7FF), const Color(0xff4338CA)),
          const SizedBox(width: 10),
          _tag("STRUT-LEVEL 4", const Color(0xffF1F5F9), Colors.grey),
        ],
      ),
    ],
  );

  Widget _tag(String text, Color bg, Color textCol) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
    child: Text(text, style: TextStyle(color: textCol, fontSize: 11, fontWeight: FontWeight.bold)),
  );

  Widget _buildTechnicalSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Technical Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 10),
      RichText(
        text: const TextSpan(
          style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
          children: [
            TextSpan(text: "Detected significant "),
            TextSpan(text: "micro-fractures in carbon strut ", style: TextStyle(color: Color(0xffA67C52), fontWeight: FontWeight.bold)),
            TextSpan(text: "assembly (Model X-82)..."),
          ],
        ),
      ),
    ],
  );

  Widget _buildPatientSubmission() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("PATIENT SUBMISSION", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
      const SizedBox(height: 15),
      Row(
        children: [
          _imageHolder('assets/image/leg1.png'),
          const SizedBox(width: 12),
          _imageHolder('assets/image/bro.png'),
        ],
      ),
    ],
  );

  Widget _imageHolder(String path) => Container(
    width: 140, height: 140,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
    ),
  );

  Widget _buildClinicalNoteSection() => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
        color: const Color(0xffF1F7F1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE2E8E2))
    ),
    child: const Text(
      "\"Patient reports unusual vibrations during gait cycle. Visual inspection confirms lateral stress points.\"",
      style: TextStyle(fontSize: 13, color: Colors.black87, fontStyle: FontStyle.italic),
    ),
  );

  Widget _buildToolsSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("REQUIRED TOOLS & PARTS", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
      const SizedBox(height: 15),
      _toolTile("C-Series Carbon Strut Kit", "SERIAL: X-82-BK"),
      const SizedBox(height: 10),
      _toolTile("Torque Calibrator v4", "DIGITAL READY"),
    ],
  );

  Widget _toolTile(String title, String sub) => ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    tileColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: const BorderSide(color: Color(0xffF1F5F9))),
    leading: const Icon(Icons.build_circle, color: Color(0xff789376)),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    subtitle: Text(sub, style: const TextStyle(fontSize: 11, color: Colors.grey)),
  );

  Widget _buildStartRepairButton() => Container(
    width: double.infinity,
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: const LinearGradient(colors: [Color(0xff88A787), Color(0xffAFC8AE)]),
    ),
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
      child: const Text("Start Repair Work", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );
}