import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'StaffDirectoryPage.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFB), // الخلفية الهادية من الصورة
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150',
            ), // صورة الدكتور
          ),
        ),
        title: const Text(
          "Clinical Sanctuary",
          style: TextStyle(
            color: Color(0xff789376),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.orangeAccent,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Badges
            Row(
              children: [
                _buildBadge(
                  "CERTIFIED CENTER",
                  const Color(0xffD1E9FF),
                  const Color(0xff2E90FA),
                ),
                const SizedBox(width: 8),
                _buildBadge(
                  "TIER 1 CLINICAL",
                  const Color(0xffE1F1F2),
                  const Color(0xff2E9090),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Advanced\nProsthetic &\nOrthotic Center",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                height: 1.1,
                color: Color(0xff101828),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Integrating robotic precision with human-centric rehabilitation services.",
              style: TextStyle(
                color: Color(0xff667085),
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              "MEDICAL SPECIALTIES",
              style: TextStyle(
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color(0xff444CE7),
              ),
            ),
            const SizedBox(height: 16),

            // كارت الـ Prosthetics
            _buildSpecialtyCard(
              title: "Prosthetics",
              sub: "Bionic limbs & AI integration",
              icon: Icons.precision_manufacturing_outlined,
              isLarge: true,
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildSpecialtyCard(
                    title: "Orthotics",
                    sub: "BRACING SYSTEMS",
                    icon: Icons.build_circle_outlined,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSpecialtyCard(
                    title: "Rehab",
                    sub: "PHYSICAL THERAPY",
                    icon: Icons.history,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            InkWell(
              onTap: () => Get.to(() => const StaffDirectoryPage()), // الانتقال لصفحة الموظفين
              borderRadius: BorderRadius.circular(16),
              child: _buildActionTile(
                title: "Staff Directory",
                icon: Icons.lightbulb_outline,
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              "CLINICAL SERVICES",
              style: TextStyle(
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color(0xff444CE7),
              ),
            ),
            const SizedBox(height: 16),
            _buildServiceTile(
              "3D Biometric Scanning",
              "High-precision fit mapping",
              Icons.fingerprint,
            ),
            _buildServiceTile(
              "Gait Analysis",
              "Motion capture diagnostics",
              Icons.analytics_outlined,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- Widgets المساعدة للوصول لنفس شكل الصورة ---

  Widget _buildBadge(String label, Color bg, Color text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      label,
      style: TextStyle(color: text, fontSize: 10, fontWeight: FontWeight.bold),
    ),
  );

  Widget _buildSpecialtyCard({
    required String title,
    required String sub,
    required IconData icon,
    bool isLarge = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.orangeAccent, size: 28),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xff101828),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            sub,
            style: const TextStyle(color: Color(0xff667085), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile({required String title, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xffFEF9C3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.orangeAccent, size: 20),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Color(0xffD0D5DD),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceTile(String title, String sub, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffFEF9C3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.orangeAccent),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                sub,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: Color(0xffD0D5DD),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xff789376),
      unselectedItemColor: const Color(0xff98A2B3),
      selectedLabelStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "HOME"),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "ORDERS"),
        BottomNavigationBarItem(
          icon: Icon(Icons.build_circle_outlined),
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
    );
  }
}
