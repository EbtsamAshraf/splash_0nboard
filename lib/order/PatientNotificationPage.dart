import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'FinalFittingCompletedPage.dart';

class PatientNotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // خلفية الصفحة الفاتحة
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), // صورة الطبيب
              radius: 18,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Limbic Editorial',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'CLINICAL CARE TEAM',
                  style: TextStyle(color: Colors.grey[600], fontSize: 10, letterSpacing: 1.2),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'TODAY',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                // رسالة الترحيب من العيادة
                _buildChatBubble(
                  "Great news Robert! Your prosthetic is ready. Please confirm your arrival for the final fitting tomorrow at 10:00 AM at the clinic.",
                ),
                const SizedBox(height: 20),

                // كارت تفاصيل الموعد
                _buildAppointmentCard(),

                const SizedBox(height: 20),

                // رسالة رد المريض
                _buildPatientReply("That's amazing news! I'll be there. Thank you so much for the update."),
              ],
            ),
          ),

          // شريط إدخال الرسائل السفلي
          _buildMessageInput(),
        ],
      ),
    );
  }

  // فقاعة دردشة العيادة
  Widget _buildChatBubble(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, height: 1.4),
        ),
      ),
    );
  }

  // كارت تحديد الموعد
  Widget _buildAppointmentCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E7FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.accessibility_new, color: Color(0xFF4F46E5)),
              ),
              const SizedBox(width: 15),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Final Fitting Session', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('Limbic Medical Wing B', style: TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildInfoColumn("DATE", "Oct 24, 2023"),
              const SizedBox(width: 20),
              _buildInfoColumn("TIME", "10:00 AM"),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: // داخل ميثود _buildAppointmentCard
    ElevatedButton(
    onPressed: () {
    // التنقل لصفحة إتمام العملية النهائية
    Get.to(() => const FinalFittingCompletedPage());
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: const Color(0xFFA3B18A),
    padding: const EdgeInsets.symmetric(vertical: 15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 0,
    ),
    child: const Text(
    'Confirm Arrival',
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    ),),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Reschedule', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // فقاعة رد المريض
  Widget _buildPatientReply(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 280,
        decoration: BoxDecoration(
          color: const Color(0xFFA3B18A).withOpacity(0.8),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.4),
        ),
      ),
    );
  }

  // شريط إدخال الرسالة السفلي
  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: SafeArea(
        child: Row(
          children: [
            const Icon(Icons.add_circle_outline, color: Colors.grey),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            CircleAvatar(
              backgroundColor: const Color(0xFFA3B18A),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}