import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'PatientNotificationPage.dart';

class QualityReportView extends StatelessWidget {
  const QualityReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: const Text("Quality Report Review",
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 25),
            const Text("FINISHED PROSTHETIC IMAGE",
                style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
            const SizedBox(height: 15),
            _buildProstheticImage(),
            const SizedBox(height: 30),
            const Text("QUALITY CONTROL CHECKLIST",
                style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
            const SizedBox(height: 15),
            _buildChecklistItem("Socket Durability", "PASSED"),
            _buildChecklistItem("Joint Movement", "PASSED"),
            _buildChecklistItem("Alignment Accuracy", "PASSED"),
            const SizedBox(height: 30),
            const Text("TECHNICIAN COMMENTS",
                style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
            const SizedBox(height: 15),
            _buildTechnicianComment(),
            const SizedBox(height: 40),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text("Johnathan Doe", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text("Device: Lower Limb Transtibial (v1.0)", style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ]),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(5)),
        child: const Text("ID: #88291", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      )
    ],
  );

  Widget _buildProstheticImage() => Column(
    children: [
      Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffF8F9FA),
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(image: AssetImage('assets/image/brok.png'), fit: BoxFit.contain),
        ),
      ),
      const SizedBox(height: 10),
      Text("Captured by Technician: Robert M. • 2 hours ago",
          style: TextStyle(color: Colors.grey[500], fontSize: 11)),
    ],
  );

  Widget _buildChecklistItem(String title, String status) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[200]!),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(children: [
      const Icon(Icons.check_circle, color: Colors.green, size: 20),
      const SizedBox(width: 15),
      Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      const Spacer(),
      Text(status, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 11)),
    ]),
  );

  Widget _buildTechnicianComment() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(12)),
    child: Column(children: [
      const Text("\"The socket was reinforced with carbon fiber as per the request... Ready for final fitting.\"",
          style: TextStyle(height: 1.5, fontStyle: FontStyle.italic, color: Colors.black87)),
      const SizedBox(height: 15),
      Row(children: [
        CircleAvatar(radius: 12, backgroundColor: Colors.grey[300], child: const Text("RM", style: TextStyle(fontSize: 9))),
        const SizedBox(width: 10),
        const Text("Robert Miller, CPO Tech", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      ]),
    ]),
  );

  Widget _buildActionButtons() => Column(children: [
    // زر الموافقة وإرسال الإشعار للمريض
    InkWell(
      onTap: () {
        // التنقل لصفحة محادثة المريض وتأكيد الموعد
        Get.to(() =>  PatientNotificationPage());
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Color(0xffAFC8AE), Color(0xff9DB29D)],
          ),
        ),
        child: const Center(
          child: Text(
            "Approve for Fitting & Notify Patient",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
    const SizedBox(height: 12),
    // زر طلب تعديلات (لو حابة تربطيه بصفحة تانية مستقبلاً)
    TextButton(
      onPressed: () {
        // منطق طلب تعديل على الجهاز
      },
      child: const Text(
        "Request Adjustment",
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    ),
  ]);
}