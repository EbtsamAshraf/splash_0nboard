import 'package:flutter/material.dart';

class TechnicianCard extends StatelessWidget {
  final String name;
  final String rate;
  final String jobs;
  final String dist;
  final String img;

  const TechnicianCard({
    super.key,
    required this.name,
    required this.rate,
    required this.jobs,
    required this.dist,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white, // خلفية بيضاء زي الديزاين
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04), // ظل خفيف جداً
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: const Color(0xffF1F5F9)), // إطار خفيف جداً
      ),
      child: Row(
        children: [
          // الصورة دائرية بحواف ناعمة
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              img,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              // حماية لو الصورة مش موجودة عشان ميعملش إيرور أحمر
              errorBuilder: (context, error, stackTrace) => Container(
                width: 50, height: 50, color: Colors.grey[200],
                child: const Icon(Icons.person, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // استخدام Expanded لمنع الـ Overflow (الخطوط الصفراء)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    // منطقة التقييم (النجمة والتقييم)
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          rate,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.orange),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                // السطر اللي فيه الشنطة والمكان
                Row(
                  children: [
                    const Icon(Icons.work_outline, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(jobs, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(width: 12),
                    const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(dist, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}