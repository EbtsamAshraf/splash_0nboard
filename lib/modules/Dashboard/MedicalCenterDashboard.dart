import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:splash_0nboard/modules/Dashboard/view/MaintenanceView.dart';
import 'package:splash_0nboard/modules/Dashboard/widgets/BottomNav.dart';
import 'package:splash_0nboard/modules/Dashboard/widgets/Clinic%20Rating.dart';
import 'package:splash_0nboard/modules/Dashboard/widgets/Maintenance.dart';
import 'package:splash_0nboard/modules/Dashboard/widgets/Patient%20Orders.dart';

import '../../core/them/app_colors.dart';
import '../../order/MedicalAnalyticsView.dart';
import '../sing_up/view/CompleteProfileView.dart';
import 'controller/NavigationController.dart';

class MedicalCenterDashboard extends StatelessWidget {
  const MedicalCenterDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // تشغيل الكنترولر فوراً عشان الإيرور الأحمر يختفي
    final NavigationController controller = Get.put(NavigationController());

    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      // بنستخدم Obx هنا عشان لما تضغطي تحت يغير الصفحة فوراً
        body: Obx(() => IndexedStack(
      index: controller.currentIndex.value,
      children: [
        _buildHomeContent(), // محتوى الهوم "الصافي"
        const SizedBox(),
        const MaintenanceRequestsView(), // اتأكدي إن الصفحة دي "صافية" مفيش فيها Scaffold
        const SizedBox(),
        const SizedBox(),
      ],
    )),
    bottomNavigationBar: buildBottomNav(), // ده البار الوحيد اللي المفروض يبقى موجود
    );
  }

  // ده محتوى الهوم الصافي (بدون Scaffold تاني)
  Widget _buildHomeContent() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 25),
            _buildMainOverviewCard(),
            const SizedBox(height: 25),
            _buildSectionHeader("Patient Orders", "VIEW LEDGER"),
            const SizedBox(height: 15),
            buildOrdersGrid(),
            const SizedBox(height: 20),
            _buildCompletedOrdersCard(),
            const SizedBox(height: 25),
            buildMaintenanceSection(),
            const SizedBox(height: 25),
            buildClinicRating(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

// ضيفي هنا باقي الميثودز (_buildHeader, _buildMainOverviewCard, إلخ) اللي كانت عندك
}
  // الهيدر العلوي (اللوجو والاشعار)
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(color: Color(0xff1A4D4D), shape: BoxShape.circle),
              child: const Icon(Icons.medical_services, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            const Text("Clinical Sanctuary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff88A787))),
          ],
        ),
        const Icon(Icons.notifications_none_outlined, size: 28, color: Color(0xffE9E1B3)),
      ],
    );
  }

  // الكارت الأخضر الكبير
  Widget _buildMainOverviewCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        gradient: const LinearGradient(
          colors: [Color(0xff88A787), Color(0xffE9E1B3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("MORNING OVERVIEW", style: TextStyle(color: AppColor.bluelight, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
          const SizedBox(height: 10),
          const Text("Welcome back,\nDr. Adrian Vance", style: TextStyle(color: AppColor.whitColor, fontSize: 26, fontWeight: FontWeight.bold, height: 1.6)),
          const SizedBox(height: 30),
          Row(
            children: [
              _buildStatMiniCard("Clinic Efficiency", "94.2%", Icons.arrow_upward),
              const SizedBox(width: 15),
              _buildStatMiniCard("Active Cases", "128", null),
            ],
          ),
          const SizedBox(height: 25),
          const SizedBox(height: 25),
          // التعديل هنا: إضافة InkWell للربط بصفحة الإحصائيات
          Center(
            child: InkWell(
              onTap: () {
                // فتح صفحة الإحصائيات الطبية
                Get.to(() => const MedicalAnalyticsView());
              },
              child: const Text(
                  "Clinical Performance & Analytics >",
                  style: TextStyle(
                      color: AppColor.fontColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  )
              ),
            ),
          ),
        ],
      ),
    );

  }

  Widget _buildStatMiniCard(String label, String value, IconData? icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppColor.bluelight, fontSize: 16)),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                if (icon != null) Icon(icon, color: Colors.white, size: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // كارت الـ Completed Orders الجديد (بالصور الصغيرة)
  Widget _buildCompletedOrdersCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.whitColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: AppColor.blackColor.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xffE9E1B3).withOpacity(0.2), shape: BoxShape.circle),
            child: const Icon(Icons.check_circle_outline, color: AppColor.iconyellow, size: 34),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Completed Orders", style: TextStyle(color: AppColor.fontColor, fontSize: 14)),
                Text("42", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color:AppColor.greenDark),),
              ],
            ),
          ),
          // محاكاة لصور المستخدمين الصغيرة
          const SizedBox(
            width: 80,
            child: Stack(
              children: [
                CircleAvatar(radius: 14, backgroundColor: Colors.grey),
                Positioned(left: 20, child: CircleAvatar(radius: 14, backgroundColor: Colors.blueGrey)),
                Positioned(left: 40, child: CircleAvatar(radius: 14, child: Text("+3", style: TextStyle(fontSize: 10)))),
              ],
            ),
          )
        ],
      ),
    );
  }

// باقي الميثودز (Grid, Maintenance, Rating) اللي بعتهملك المرة اللي فاتت حطيهم هنا
// ... مع التأكد من نداء _buildSectionHeader بدل Text العادي للعناوين


Widget _buildSectionHeader(String title, String action) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColor.green)),
      Text(action, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.green, letterSpacing: 0.5)),
    ],
  );
}