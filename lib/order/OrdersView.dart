import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/them/app_colors.dart';
import 'UrgentOrderDetailsView.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildHeader(),
            const SizedBox(height: 25),
            _buildSearchBar(),
            const SizedBox(height: 30),
            // كارت إلياس ثورن
            const OrderCard(
              name: "Elias Thorne",
              orderId: "#PX-9921",
              location: "Clinic",
              procedure: "L-Transtibial",
              tag: "URGENT",
              img: "assets/image/dr1.png", // تأكدي من وجود الصورة
              buttonText: "Start Assessment",
            ),
            const SizedBox(height: 20),
            // كارت سارة جينكينز
            const OrderCard(
              name: "Sarah Jenkins",
              orderId: "#PX-9844",
              location: "Clinic",
              procedure: "R-Transfemoral",
              tag: "PAID",
              img: "assets/image/dr2.png", // تأكدي من وجود الصورة
              buttonText: "View Details",
              isUrgent: false,
            ),
            const SizedBox(height: 20),
            // كارت ماركوس فان
            const OrderCard(
              name: "Marcus Vane",
              orderId: "#PX-9730",
              location: "Clinic",
              procedure: "Upper Limb",
              tag: "PAID",
              img: "assets/image/drr.png", // تأكدي من وجود الصورة
              buttonText: "View Details",
              isUrgent: false,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 20),
      onPressed: () => Get.back(), // زرار الرجوع شغّال
    ),
    title: const Text("Clinical Sanctuary",
        style: TextStyle(
            color: Color(0xff789376),
            fontWeight: FontWeight.bold,
            fontSize: 18)),
    centerTitle: true,
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 15),
        child: CircleAvatar(
            radius: 16, backgroundImage: AssetImage('assets/image/bar.png')),
      )
    ],
  );

  Widget _buildHeader() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("ACTIVE INTAKE",
          style: TextStyle(
              color: Color(0xff789376),
              fontSize: 11,
              fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      const Text("Orders",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900)),
      const SizedBox(height: 15),
      Text(
          "Review and process new prosthetic fabrication requests from the clinical floor.",
          style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.5)),
    ],
  );

  Widget _buildSearchBar() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ]),
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Search patients...",
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        suffixIcon: Icon(Icons.tune, color: Color(0xff789376)),
        border: InputBorder.none,
      ),
    ),
  );
}

// Widget مخصص لكارت الأمر (عشان الكود يبقى نضيف)
class OrderCard extends StatelessWidget {
  final String name, orderId, location, procedure, tag, img, buttonText;
  final bool isUrgent;

  const OrderCard({
    super.key,
    required this.name,
    required this.orderId,
    required this.location,
    required this.procedure,
    required this.tag,
    required this.img,
    required this.buttonText,
    this.isUrgent = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 15,
              offset: const Offset(0, 8))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 22, backgroundImage: AssetImage(img)),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("Order ID: $orderId",
                          style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (isUrgent)
                    _tag("URGENT", const Color(0xffFEE2E2), const Color(0xffEF4444)),
                  const SizedBox(height: 5),
                  _tag(tag, const Color(0xffE0E7FF), const Color(0xff4338CA)),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _infoTile("LOCATION", location, Icons.location_on_outlined),
              const SizedBox(width: 30),
              _infoTile("PROCEDURE", procedure, Icons.assignment_outlined),
            ],
          ),
          const SizedBox(height: 20),
          _buildActionButton(),
        ],
      ),
    );
  }

  Widget _tag(String text, Color bg, Color textCol) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
    child: Text(text,
        style: TextStyle(color: textCol, fontSize: 10, fontWeight: FontWeight.bold)),
  );

  Widget _infoTile(String label, String value, IconData icon) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
      const SizedBox(height: 5),
      Row(
        children: [
          Icon(icon, size: 14, color: const Color(0xff789376)),
          const SizedBox(width: 5),
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xff1A4D4D))),
        ],
      )
    ],
  );

  // جوه كلاس OrderCard في ملف OrdersView.dart

  Widget _buildActionButton() => GestureDetector(
    onTap: () {
      // الربط السحري: لما نضغط على الزرار، نفتح الصفحة الجديدة
      Get.to(() => const UrgentOrderDetailsView());
    },
    child: Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: isUrgent
            ? const LinearGradient(colors: [Color(0xff88A787), Color(0xffAFC8AE)])
            : null,
        color: isUrgent ? null : const Color(0xffF1F5F9),
      ),
      child: Center(
        child: Text(
          buttonText, // دي هتكون "Start Assessment" لكارت إلياس
          style: TextStyle(
              color: isUrgent ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
      ),
    ),
  );
}