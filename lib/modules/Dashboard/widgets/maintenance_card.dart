import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/them/app_colors.dart';
import '../view/MaintenanceDetailsView.dart';

class MaintenanceCard extends StatelessWidget {
  final String tag, id, name, desc, time, status;
  final bool hasNote, isScheduled;

  const MaintenanceCard({
    super.key,
    required this.tag,
    required this.id,
    required this.name,
    required this.desc,
    required this.time,
    required this.status,
    this.hasNote = false,
    this.isScheduled = false,
  });

  @override
  Widget build(BuildContext context) {
    Color tagColor = tag == "URGENT REPAIR"
        ? AppColor.orangColor
        : AppColor.greenLight;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.whitColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: AppColor.blackColor.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardHeader(tagColor),
          const SizedBox(height: 20),
          Text(
            id,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColor.blackColor,
            ),
          ),
          const SizedBox(height: 15),
          _buildUserInfo(),
          if (hasNote) _buildNote(),
          const SizedBox(height: 20),
          _buildFooter(),
        ],
      ),
    );
  }

  // ميثودز داخلية للكارت عشان الكود يبقى منظم
  Widget _buildCardHeader(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            tag,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              status,
              style: const TextStyle(color: AppColor.greyColor, fontSize: 12),
            ),
            Text(
              time,
              style: const TextStyle(
                color: AppColor.font,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        const CircleAvatar(radius: 22, backgroundColor: Colors.grey),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Text(
              desc,
              style: const TextStyle(color: AppColor.greyColor, fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNote() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xffF8FAFC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Text(
        "\"Joint hydraulic pressure drop detected during gait cycle.\"",
        style: TextStyle(fontSize: 16, color: AppColor.font, height: 1.5),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isScheduled
            ? const Row(
                children: [
                  Icon(Icons.access_time, size: 16, color: AppColor.greyColor),
                  Text(
                    " LAST SERVICE: 6MO AGO",
                    style: TextStyle(fontSize: 13, color: AppColor.greyColor),
                  ),
                ],
              )
            : InkWell(
                // تحويل النص لزرار تفاعلي
          onTap: () {
            Get.to(() => const MaintenanceRequestDetailsView());
          },

                borderRadius: BorderRadius.circular(5),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    "View Details >",
                    style: TextStyle(
                      color: AppColor
                          .green, // تغيير اللون للأخضر عشان يبان إنه زرار
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
        if (isScheduled)
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColor.green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.build, color: AppColor.whitColor, size: 18),
          ),
      ],
    );
  }
}
