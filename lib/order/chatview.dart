import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'OrderFabricationDetailsView.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Center(
                  child: Text(
                    "TODAY, 10:42 AM",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildChatBubble(
                  "Are you ready for your technician appointment at the clinic?",
                  isSender: true,
                  time: "10:42 AM",
                ),
                const SizedBox(height: 15),
                _buildChatBubble("Yes", isSender: false, time: "10:45 AM"),
                const SizedBox(height: 15),
                _buildInfoBubble(
                  "Measurements taken, production started. Here is your tracking link.",
                ),
                const SizedBox(height: 15),
                _buildFileBubble(
                  "Prosthetic-Order-Track",
                  "Secure Portal • Live Update",
                ),
                const SizedBox(height: 15),
                _buildClinicGuidelines(),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBar(
    backgroundColor: Colors.white,
    elevation: 0.5,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.grey),
      onPressed: () => Get.back(),
    ),
    title: Row(
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage('assets/image/dr1.png'),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "patient",
              style: TextStyle(color: Color(0xff789376), fontSize: 12),
            ),
            Text(
              "DR. ADRIAN VANCE • ACTIVE",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
    actions: const [
      Icon(Icons.videocam_outlined, color: Color(0xffE9E1B3)),
      SizedBox(width: 15),
      Icon(Icons.notifications_none_outlined, color: Color(0xffE9E1B3)),
      SizedBox(width: 15),
    ],
  );

  Widget _buildChatBubble(
    String text, {
    required bool isSender,
    required String time,
  }) => Align(
    alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: isSender
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          constraints: const BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            color: isSender
                ? const Color(0xffAFC8AE).withOpacity(0.4)
                : const Color(0xffF1F5F9),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(text, style: const TextStyle(fontSize: 14, height: 1.4)),
        ),
        const SizedBox(height: 4),
        Text(time, style: const TextStyle(color: Colors.grey, fontSize: 10)),
      ],
    ),
  );

  Widget _buildInfoBubble(String text) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xffAFC8AE).withOpacity(0.4),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      children: [
        Text(text, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 10),
        // تحويل شكل الزرار لزرار حقيقي قابل للضغط
        InkWell(
          onTap: () {
            // الانتقال لصفحة تفاصيل التصنيع (الجدول الزمني وصورة الجهاز)
            Get.to(() => const OrderFabricationDetailsView());
          },
          borderRadius: BorderRadius.circular(10), // عشان تأثير الضغطة يكون مظبوط
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View Details",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Icon(Icons.open_in_new, size: 16),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildFileBubble(String title, String sub) => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: Colors.grey[200]!),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xffE0E7FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.inventory_2_outlined,
            color: Color(0xff4338CA),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        const Spacer(),
        const Icon(Icons.open_in_new, color: Color(0xff4338CA), size: 20),
      ],
    ),
  );

  Widget _buildClinicGuidelines() => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color(0xffF1F5F9),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.info_outline, color: Colors.grey, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Clinic Guidelines",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Final fitting appointments are typically scheduled within 7-10 business days of production start.",
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildMessageInput() => Container(
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Colors.white,
      border: Border(top: BorderSide(color: Color(0xffF1F5F9))),
    ),
    child: Row(
      children: [
        const Icon(Icons.add_circle_outline, color: Colors.grey),
        const SizedBox(width: 15),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xffF1F5F9),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        const CircleAvatar(
          backgroundColor: Color(0xff789376),
          child: Icon(Icons.send, color: Colors.white, size: 20),
        ),
      ],
    ),
  );
}
