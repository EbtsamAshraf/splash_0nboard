import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'MaintenanceRequestDetailsView.dart';
import '../controller/NavigationController.dart';
import '../widgets_rebo/TechnicianCard.dart';

class AssignSpecialistView extends StatelessWidget {
  const AssignSpecialistView({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navSelection = Get.put(NavigationController());
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      navSelection.updateBarVisibility(scrollController);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 20),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Assign Specialist",
          style: TextStyle(
            color: Color(0xff88A787),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/image/bar.png'),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "PATIENT PROFILE",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                _buildPatientHeader(),
                const SizedBox(height: 15),
                _buildCurrentIssueCard(),
                const SizedBox(height: 30),
                _buildTechniciansSection(), // نداء الميثود هنا
                const SizedBox(height: 30),
                const Text(
                  "Schedule Visit",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                _buildScheduleFields(), // نداء الميثود هنا مع الـ underscore
                const SizedBox(height: 40),
                _buildAssignButton(),
              ],
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: navSelection.isBarVisible.value ? 0 : -100,
              left: 0,
              right: 0,
              child: _buildBottomNav(navSelection),
            ),
          ),
        ],
      ),
    );
  }

  // --- الـ Widgets الداخلية مع إصلاح الأخطاء ---

  Widget _buildPatientHeader() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "Robert Miller",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xffE0E7FF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          "ID: RM-8821",
          style: TextStyle(
            color: Color(0xff4338CA),
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );

  Widget _buildCurrentIssueCard() => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
      ],
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xffFEE2E2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.build, color: Color(0xffEF4444), size: 20),
        ),
        const SizedBox(width: 15),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CURRENT ISSUE",
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Broken joint connection",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    ),
  );

  // هنا التصليح: قفلنا الـ Column وقفنا الـ Method صح
  Widget _buildTechniciansSection() => Column(
    children: const [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Available Technicians",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("3 nearby", style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
      SizedBox(height: 15),
      TechnicianCard(
        name: "Sarah Chen",
        rate: "4.9",
        jobs: "2 Active Jobs",
        dist: "0.8 mi",
        img: "assets/image/dr1.png",
      ),
      SizedBox(height: 12),
      TechnicianCard(
        name: "Marcus Thorne",
        rate: "4.7",
        jobs: "1 Active Job",
        dist: "2.4 mi",
        img: "assets/image/dr2.png",
      ),
      SizedBox(height: 12),
      TechnicianCard(
        name: "Elena Rodriguez",
        rate: "5.0",
        jobs: "3 Active Jobs",
        dist: "1.1 mi",
        img: "assets/image/drr.png",
      ),
    ],
  );

  Widget _buildScheduleFields() {
    return Row(
      children: [
        Expanded(child: _dateField("DATE", "11/24/2023", Icons.calendar_today)),
        const SizedBox(width: 15),
        Expanded(child: _dateField("TIME", "02:30 PM", Icons.access_time)),
      ],
    );
  }

  Widget _dateField(String label, String val, IconData icon) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xffF1F5F9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(val),
            const Spacer(),
            Icon(icon, size: 16, color: Colors.grey),
          ],
        ),
      ),
    ],
  );


  Widget _buildAssignButton() => GestureDetector(
    onTap: () {
      // السطر ده هو اللي هيوديكي لصفحة التفاصيل
      Get.to(() => const MaintenanceRequestDetailsView());    },
    child: Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff88A787), Color(0xffAFC8AE)],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Center(
        child: Text(
          "Assign & Notify",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );

  Widget _buildBottomNav(
    NavigationController controller,
  ) => BottomNavigationBar(
    currentIndex: controller.currentIndex.value,
    onTap: (i) => controller.changeIndex(i),
    selectedItemColor: const Color(0xff88A787),
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "HOME"),
      BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "ORDERS"),
      BottomNavigationBarItem(icon: Icon(Icons.build), label: "MAINTENANCE"),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat_bubble_outline),
        label: "MESSAGES",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: "PROFILE",
      ),
    ],
  );
}
