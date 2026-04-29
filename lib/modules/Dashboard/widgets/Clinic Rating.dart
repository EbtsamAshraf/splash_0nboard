import 'package:flutter/material.dart';

import '../../../core/them/app_colors.dart';

Widget buildClinicRating() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: IntrinsicHeight( // عشان الخط الفاصل يظبط طوله تلقائي
      child: Row(
        children: [
          // الجزء الشمال (النجوم)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Clinic Rating",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xff1A4D4D))),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 20),
                    const SizedBox(width: 5),
                    const Text("4.9",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xff1A4D4D))),
                    const SizedBox(width: 5),
                    Text("Excellent (2.4k reviews)",
                        style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),

          // الخط الفاصل الرفيع
          VerticalDivider(color: Colors.grey.shade200, thickness: 1, indent: 5, endIndent: 5),

          // الجزء اليمين (الترتيب)
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("TOP 1%",
                    style: TextStyle(color: AppColor.green, fontWeight: FontWeight.bold, fontSize: 14)),
                Text("Regional Rank",
                    style: TextStyle(color: AppColor.font, fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}