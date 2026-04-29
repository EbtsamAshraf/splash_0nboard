import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/them/app_colors.dart';
import 'RequestApprovedView.dart';

class UrgentOrderDetailsView extends StatelessWidget {
  const UrgentOrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 120), // مسافة تحت للأزرار
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderRibbon(),
                const SizedBox(height: 20),
                const Text(
                  "Prosthetic Knee\nAssembly & Alignment",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, height: 1.2),
                ),
                const SizedBox(height: 25),
                _buildOrderSummaryCard(),
                const SizedBox(height: 25),
                _buildPatientRequirementsCard(),
                const SizedBox(height: 25),
                _buildFinancialStatusCard(),
                const SizedBox(height: 25),
                _buildServiceLogisticsCard(),
                const SizedBox(height: 40),
              ],
            ),
          ),
          _buildBottomActionButtons(), // الأزرار الثابتة تحت
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 20),
      onPressed: () => Get.back(),
    ),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
            radius: 14, backgroundImage: AssetImage('assets/image/dr1.png')), // تأكدي من الصورة
        const SizedBox(width: 10),
        Text("Order Management",
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
                fontSize: 16)),
      ],
    ),
    centerTitle: true,
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 15),
        child: Icon(Icons.notifications_none_outlined,
            color: Color(0xffE9E1B3), size: 26),
      )
    ],
  );

  Widget _buildHeaderRibbon() => Row(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: const Color(0xffFEE2E2), borderRadius: BorderRadius.circular(20)),
        child: const Text("! URGENT ORDER",
            style: TextStyle(
                color: Color(0xffEF4444),
                fontSize: 11,
                fontWeight: FontWeight.bold)),
      ),
      const SizedBox(width: 15),
      const Text("Order ID: #PR-99210-URG",
          style: TextStyle(color: Colors.grey, fontSize: 13)),
    ],
  );

  Widget _buildOrderSummaryCard() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("ORDER SUMMARY",
                style: TextStyle(
                    color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            Icon(Icons.assignment_outlined, color: Color(0xffE0E7FF), size: 20),
          ],
        ),
        const SizedBox(height: 15),
        const Text("Biomimetic Carbon Fiber\nSystem",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        _infoRow("COMPONENT SKU", "L-5680-CFX-MAX"),
        _infoRow("REQUESTED BY", "Dr. Elias Thorne, MD"),
        _infoRow("REQUEST DATE", "Oct 24, 2023 • 08:15 AM"),
        _infoRow("MEASUREMENT LOCATION", "Center", icon: Icons.location_on_outlined),
      ],
    ),
  );

  Widget _infoRow(String label, String value, {IconData? icon}) => Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Row(
          children: [
            if (icon != null)
              Icon(icon, size: 14, color: const Color(0xff789376)),
            if (icon != null) const SizedBox(width: 5),
            Text(value,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          ],
        ),
      ],
    ),
  );

  Widget _buildPatientRequirementsCard() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("PATIENT REQUIREMENTS",
                style: TextStyle(
                    color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            const Spacer(),
            Icon(Icons.help_outline, color: Colors.grey[300], size: 20),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[100],
                child: const Icon(Icons.person_outline,
                    color: Colors.grey, size: 18)),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                  "\"Patient wants a technician to contact them directly regarding the socket fit comfort prior to shipping the final assembly.\"",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14, height: 1.5)),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.centerRight,
          child: Text("Johnathan D., Lead Patient",
              style: TextStyle(color: Colors.grey[500], fontSize: 12)),
        )
      ],
    ),
  );

  Widget _buildFinancialStatusCard() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("FINANCIAL STATUS",
                style: TextStyle(
                    color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("\$12,450.00",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Inclusive of insurance adjustment",
                style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                  color: const Color(0xffECFDF5), borderRadius: BorderRadius.circular(20)),
              child: const Text("PAID IN FULL",
                  style: TextStyle(
                      color: Color(0xff10B981),
                      fontSize: 10,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),
            const Icon(Icons.verified_user_outlined, color: Colors.grey, size: 20),
          ],
        )
      ],
    ),
  );

  Widget _buildServiceLogisticsCard() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("SERVICE LOGISTICS",
            style: TextStyle(
                color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        _logisticsTile(Icons.store_outlined, "CLINIC LOCATION", "Northwest Clinic", "802 Clinical Way, Seattle WA"),
        const SizedBox(height: 15),
        _logisticsTile(Icons.calendar_today, "FITTING APPOINTMENT", "Tomorrow, Oct 25", "10:30 AM (Reserved)"),
        const SizedBox(height: 20),
        Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage('assets/image/dr1.png'), fit: BoxFit.cover)), // تأكدي من صورة الخريطة
          child: const Center(
              child: Text("VIEW MAP",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        )
      ],
    ),
  );

  Widget _logisticsTile(IconData icon, String label, String title, String sub) => Row(
    children: [
      CircleAvatar(
          radius: 18,
          backgroundColor: const Color(0xffF1F7F1),
          child: Icon(icon, color: const Color(0xff789376), size: 18)),
      const SizedBox(width: 15),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
          Text(title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      )
    ],
  );

  Widget _buildBottomActionButtons() => Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5))
          ]),
      child: Column(
        children: [
          // زرار الـ Accept بعد التعديل
          InkWell(
            onTap: () {
              // بينقلك لصفحة النجاح (الصح الأخضر)
              Get.to(() => const RequestApprovedView());
            },
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      colors: [Color(0xff88A787), Color(0xffAFC8AE)])),
              child: const Center(
                  child: Text("✓ Accept Order",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          ),
          const SizedBox(height: 10),
          // زرار الـ Reject
          InkWell(
            onTap: () {
              Get.back(); // بيرجعك للصفحة اللي قبلها لو رفضتِ
            },
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffF1F5F9)),
              child: const Center(
                  child: Text("✕ Reject Request",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold))),
            ),
          ),
        ],
      ),
    ),
  );
}