import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'QualityReportView.dart';

class OrderFabricationDetailsView extends StatelessWidget {
  const OrderFabricationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Get.back()),
        actions: [IconButton(icon: const Icon(Icons.notifications_none, color: Colors.black), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("FABRICATION COMPLETE", style: TextStyle(color: Colors.grey, letterSpacing: 1.2, fontSize: 10, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Order #LB-2024-089", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const Text("The precision manufacturing phase is finished. The device has passed all structural integrity benchmarks and is prepared for deployment.",
                style: TextStyle(color: Colors.grey, height: 1.4, fontSize: 13)),
            const SizedBox(height: 15),
            _buildStatusBadge(),
            const SizedBox(height: 25),
            _buildDeviceImage(),
            const SizedBox(height: 30),
            const Text("Device Specifications", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            // تقسيم المواصفات 2 في 2 زي الصورة
            _buildSpecsGrid(),
            const SizedBox(height: 20),
            _buildQualityButton(),
            const SizedBox(height: 40),
            _buildTimelineSection(),
            const SizedBox(height: 40),
            // جزء المريض الجديد
            _buildAssignedPatientCard(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(color: const Color(0xffE0E7FF), borderRadius: BorderRadius.circular(20)),
    child: const Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(Icons.check_circle, color: Color(0xff4338CA), size: 14),
      SizedBox(width: 8),
      Text("Ready for Clinical Fitting", style: TextStyle(color: Color(0xff4338CA), fontWeight: FontWeight.bold, fontSize: 11)),
    ]),
  );

  Widget _buildDeviceImage() => Container(
    height: 220,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: const DecorationImage(image: AssetImage('assets/image/brok.png'), fit: BoxFit.cover), // استخدمي صورتك هنا
    ),
    child: Stack(
      children: [
        Positioned(bottom: 15, left: 15, child: _buildImageTag("V-4 CORE TECH")),
        Positioned(bottom: 15, left: 110, child: _buildImageTag("TITANIUM ALLOY")),
      ],
    ),
  );

  Widget _buildImageTag(String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(color: Colors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(5)),
    child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
  );

  Widget _buildSpecsGrid() => Column(
    children: [
      Row(children: [_specBox("MODEL", "Apex-Grip\nSubsurface"), _specBox("WEIGHT", "1.24 kg")]),
      const SizedBox(height: 20),
      Row(children: [_specBox("BATTERY LIFE", "72 Hours\n(Active)"), _specBox("CALIBRATION", "Bio-Sync Level 4")]),
    ],
  );

  Widget _specBox(String title, String value) => Expanded(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
      const SizedBox(height: 4),
      Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, height: 1.3)),
    ]),
  );
  Widget _buildQualityButton() => InkWell(
    onTap: () => Get.to(() => const QualityReportView()), // الانتقال لصفحة التقرير
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: const Color(0xffF1F3F5),
          borderRadius: BorderRadius.circular(12)
      ),
      child: const Center(
          child: Text("View Quality Report  📄",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
      ),
    ),
  );
  Widget _buildTimelineSection() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("TIMELINE EVENTS", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
      const SizedBox(height: 20),
      _timelineItem("Fabrication Finished", "Today, 09:14 AM", Colors.orange, isFirst: true),
      _timelineItem("Quality Control Check", "Yesterday, 14:22 PM", Colors.blue),
      _timelineItem("Order Initiated", "Oct 24, 2024", Colors.grey, isLast: true),
    ],
  );

  Widget _timelineItem(String title, String time, Color color, {bool isFirst = false, bool isLast = false}) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(children: [
        CircleAvatar(radius: 5, backgroundColor: isFirst ? color : color.withOpacity(0.5)),
        if (!isLast) Container(width: 1, height: 40, color: Colors.grey[200]),
      ]),
      const SizedBox(width: 15),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 4),
        Text(time, style: const TextStyle(color: Colors.grey, fontSize: 11)),
      ]),
    ],
  );

  // الكارت الخاص بالمريض اللي تحت في السكرين
  Widget _buildAssignedPatientCard() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("ASSIGNED PATIENT", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
      const SizedBox(height: 15),
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey[100]!), borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Row(children: [
              const CircleAvatar(backgroundColor: Color(0xffD1E9F6), child: Text("EH", style: TextStyle(color: Color(0xff4682A9)))),
              const SizedBox(width: 15),
              const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Elias Halloway", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("Patient ID: #PX-9902", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ]),
            ]),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(color: const Color(0xffF1F3F5), borderRadius: BorderRadius.circular(8)),
              child: const Center(child: Text("Fitting session suggested for Thursday, Nov 12", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500))),
            ),
          ],
        ),
      ),
    ],
  );
}