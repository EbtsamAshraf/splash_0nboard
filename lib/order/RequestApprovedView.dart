import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chatview.dart';

class RequestApprovedView extends StatelessWidget {
  const RequestApprovedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // أيقونة النجاح (الصح)
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [const Color(0xff88A787).withOpacity(0.2), const Color(0xffAFC8AE).withOpacity(0.4)],
                  ),
                ),
                child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xff789376),
                  child: Icon(Icons.check, color: Colors.white, size: 60),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Request Approved!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 15),
            Text(
              "The patient has been notified of the\napproval and is waiting for contact.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 40),
            // كارت ملخص الطلب المقبول
            _buildSummaryCard(),
            const SizedBox(height: 50),
// الأزرار بعد التعديل للربط مع صفحة الشات
            InkWell(
              onTap: () {
                // السطر ده هو اللي هيفتح صفحة الشات اللي عملناها
                Get.to(() => const ChatView());
              },
              borderRadius: BorderRadius.circular(15),
              child: _buildButton("Start Communication", isGreen: true),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () => Get.offAllNamed('/home'), // يرجعك للهوم ويقفل كل الصفحات اللي فاتت
              child: const Text(
                "Return to Patient List",
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xffF8FAFC),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey.withOpacity(0.1)),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("ORDER SUMMARY", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            _tag("Approved"),
          ],
        ),
        const SizedBox(height: 10),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text("Prosthetic Fitting", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Info(label: "ORDER ID", value: "#LB-2024-089"),
            _Info(label: "PATIENT NAME", value: "Robert Miller"),
          ],
        ),
        const SizedBox(height: 15),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Info(label: "CLINIC LOCATION", value: "North Wing Hub"),
            _Info(label: "DEVICE TYPE", value: "Transtibial Bionic"),
          ],
        ),
      ],
    ),
  );

  Widget _tag(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(color: const Color(0xffE0E7FF), borderRadius: BorderRadius.circular(20)),
    child: Text(text, style: const TextStyle(color: Color(0xff4338CA), fontSize: 10, fontWeight: FontWeight.bold)),
  );

  Widget _buildButton(String text, {bool isGreen = false}) => Container(
    width: double.infinity,
    height: 55,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: isGreen ? const LinearGradient(colors: [Color(0xff88A787), Color(0xffAFC8AE)]) : null,
      color: isGreen ? null : const Color(0xffF1F5F9),
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isGreen) const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 18),
          if (isGreen) const SizedBox(width: 10),
          Text(text, style: TextStyle(color: isGreen ? Colors.white : Colors.black87, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

class _Info extends StatelessWidget {
  final String label, value;
  const _Info({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
      ],
    );
  }
}