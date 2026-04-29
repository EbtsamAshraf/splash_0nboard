import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/NavigationController.dart';
import 'AssignSpecialistView.dart';

class MaintenanceRequestDetailsView extends StatelessWidget {
  const MaintenanceRequestDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // استدعاء الكنترولر عشان نتحكم في ظهور الـ Bottom Nav
    final NavigationController navSelection = Get.find<NavigationController>();
    final ScrollController scrollController = ScrollController();

    // تشغيل مستمع السكرول
    scrollController.addListener(() {
      navSelection.updateBarVisibility(scrollController);
    });

    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB), // لون الخلفية الرمادي الفاتح بتاع الفيجما
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 120), // مساحة تحت عشان البار
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderInfo(),
                const SizedBox(height: 25),
                _buildTechnicalDescriptionCard(),
                const SizedBox(height: 25),
                const Text("PATIENT SUBMISSION",
                    style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                const SizedBox(height: 15),
                _buildImageSection(),
                const SizedBox(height: 25),
                _buildClinicalNoteBox(),
                const SizedBox(height: 25),
                const Text("REQUIRED TOOLS & PARTS",
                    style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                _buildToolItem("C-Series Carbon Strut Kit", "SERIAL: X-82-BK", Icons.architecture),
                _buildToolItem("Torque Calibrator v4", "DIGITAL READY", Icons.settings_input_component),
                const SizedBox(height: 30),
                _buildStartRepairButton(),
              ],
            ),
          ),

          // الـ Bottom Navigation Bar السحري (بيظهر ويختفي مع السكرول)
          Obx(() => AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            bottom: navSelection.isBarVisible.value ? 0 : -100,
            left: 0,
            right: 0,
            child: _buildBottomNav(navSelection),
          )),
        ],
      ),
    );
  }

  // --- 1. AppBar (نفس شكل الفيجما بالظبط) ---
  PreferredSizeWidget _buildAppBar() => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 18),
      onPressed: () => Get.back(),
    ),
    title: const Text("Clinical Sanctuary",
        style: TextStyle(color: Color(0xff789376), fontWeight: FontWeight.bold, fontSize: 16)),
    centerTitle: true,
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 15),
        child: CircleAvatar(radius: 16, backgroundImage: AssetImage('assets/image/bar.png')),
      )
    ],
  );

  // --- 2. رأس الصفحة (#MT-9920 والتاجز) ---
  Widget _buildHeaderInfo() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("MAINTENANCE REQUEST", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
      const Text("#MT-9920", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
      const SizedBox(height: 10),
      Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: const Color(0xffE0E7FF), borderRadius: BorderRadius.circular(20)),
            child: const Row(
              children: [
                Icon(Icons.sync, size: 14, color: Color(0xff4338CA)),
                SizedBox(width: 5),
                Text("In-Queue", style: TextStyle(color: Color(0xff4338CA), fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const Text("STRUT-LEVEL 4", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    ],
  );

  // --- 3. كارد الوصف الفني (البوكس الأبيض بظل خفيف) ---
  Widget _buildTechnicalDescriptionCard() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 8))],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Technical Description", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
            children: [
              TextSpan(text: "Detected significant "),
              TextSpan(text: "micro-fractures in carbon strut ",
                  style: TextStyle(color: Color(0xffA67C52), fontWeight: FontWeight.bold)),
              TextSpan(text: "assembly (Model X-82). Integrity compromised at the distal connection point."),
            ],
          ),
        ),
      ],
    ),
  );

  // --- 4. جزء الصور (مظبوط عشان ميعملش Overflow) ---
  Widget _buildImageSection() => Row(
    children: [
      Expanded(child: _buildImageItem('assets/image/bro.png')),
      const SizedBox(width: 15),
    //  Expanded(child: _buildImageItem('assets/image/logo.png')),
    ],
  );

  Widget _buildImageItem(String path) => Container(
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
    ),
  );

  // --- 5. بوكس ملاحظات الطبيب (الأخضر الفاتح) ---
  Widget _buildClinicalNoteBox() => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xffF1F7F1),
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: const Color(0xffE2E8E2)),
    ),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("CLINICAL NOTE — DR. JULIAN VANE",
            style: TextStyle(color: Color(0xff789376), fontSize: 10, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text(
          "\"Patient reports unusual vibrations during gait cycle. Visual inspection confirms lateral stress points.\"",
          style: TextStyle(fontSize: 13, color: Colors.black87, fontStyle: FontStyle.italic, height: 1.4),
        ),
      ],
    ),
  );

  // --- 6. صفوف الأدوات المطلوبة ---
  Widget _buildToolItem(String title, String sub, IconData icon) => Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: const Color(0xffF1F5F9)),
    ),
    child: Row(
      children: [
        Icon(icon, color: const Color(0xff789376), size: 22),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
      ],
    ),
  );

  // --- 7. زرار Start Repair (الجرادينت) ---
  Widget _buildStartRepairButton() => Container(
    width: double.infinity,
    height: 56,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: const LinearGradient(colors: [Color(0xff88A787), Color(0xffAFC8AE)]),
    ),
    child: ElevatedButton.icon(
      onPressed: () {
        Get.to(() => const AssignSpecialistView());
      },
      icon: const Icon(Icons.play_circle_outline, color: Colors.white),
      label: const Text("Start Repair Work",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
    ),
  );

  // --- 8. الـ Bottom Navigation Bar ---
  Widget _buildBottomNav(NavigationController controller) => BottomNavigationBar(
    currentIndex: 2, // ثابت على صيانة
    onTap: (i) => controller.changeIndex(i),
    selectedItemColor: const Color(0xff789376),
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "HOME"),
      BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "ORDERS"),
      BottomNavigationBarItem(icon: Icon(Icons.build), label: "MAINTENANCE"),
      BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "PROFILE"),
    ],
  );
}