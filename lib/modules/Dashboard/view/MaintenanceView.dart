import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/them/app_colors.dart';
import '../controller/NavigationController.dart';
import '../widgets/MaintenanceHeader.dart';
import '../widgets/maintenance_card.dart';
import '../widgets/maintenance_search_bar.dart';

class MaintenanceRequestsView extends StatelessWidget {
  const MaintenanceRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navSelection = Get.put(NavigationController());
    return Scaffold(
      backgroundColor: AppColor.faild,
      bottomNavigationBar: _buildFixedBottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColor.green,
        child: const Icon(Icons.add, color: AppColor.whitColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MaintenanceHeader(),
              const SizedBox(height: 30),
              _buildSectionTitle(),
              const SizedBox(height: 10),
              _buildMainTitle(),
              const SizedBox(height: 20),
              const Text(
                "Reviewing prosthetic structural integrity and sensory feedback calibration requests.",
                style: TextStyle(
                  color: AppColor.greyColor,
                  fontSize: 18,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 25),
              const MaintenanceSearchBar(),
              const SizedBox(height: 35),

              // الكروت المفصولة
              const MaintenanceCard(
                tag: "URGENT REPAIR",
                id: "M-882-PX",
                name: "Sarah J. Wellington",
                desc: "Left Transtibial - Actuation Error",
                time: "2h ago",
                status: "INITIATED",
                hasNote: true,
              ),
              const SizedBox(height: 20),
              const MaintenanceCard(
                tag: "SCHEDULED",
                id: "M-914-LY",
                name: "Marcus Thorne",
                desc: "Bi-lateral Hand - Firmware Sync",
                time: "Tomorrow",
                status: "APPOINTMENT",
                isScheduled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "SERVICE MANAGEMENT",
          style: TextStyle(
            color: AppColor.green,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        Text(
          "8 Tickets Active",
          style: TextStyle(color: AppColor.greyColor, fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildMainTitle() {
    return const Text(
      "Maintenance",
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: AppColor.fontColor,
        letterSpacing: -1,
      ),
    );
  }
}

Widget _buildFixedBottomNav() {
  final NavigationController controller = Get.put(NavigationController());
  return Obx(
    () => BottomNavigationBar(
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.changeIndex(index);
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xff88A787),
      unselectedItemColor: Colors.grey,


      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "HOME"),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "ORDERS"),
        BottomNavigationBarItem(
          icon: Icon(Icons.build_outlined),
          label: "MAINTENANCE",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: "MESSAGES",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "PROFILE",
        ),
      ],
    ),
  );
}
