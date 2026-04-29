import 'package:flutter/material.dart';

import 'StaffDirectoryPage.dart';

class MemberSuccessPage extends StatelessWidget {
  const MemberSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // كارت النجاح الأساسي
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
                ),
                child: Column(
                  children: [
                    // أيقونة الصح الخضراء
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF8BA68D).withOpacity(0.15),
                        border: Border.all(color: const Color(0xFF8BA68D), width: 2),
                      ),
                      child: const Icon(Icons.check_circle, color: Color(0xFF8BA68D), size: 50),
                    ),
                    const SizedBox(height: 25),
                    const Text('Member Added Successfully',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                    const SizedBox(height: 12),
                    const Text(
                      'The new staff record has been successfully integrated into the medical center database.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF64748B), fontSize: 13, height: 1.5),
                    ),
                    const SizedBox(height: 30),

                    // كارت معاينة بيانات الموظف (Preview Card)
                    _buildMemberPreviewCard(),

                    const SizedBox(height: 30),

                    // زرار العودة للدليل (View Directory)
                    _buildPrimaryButton(context),

                    const SizedBox(height: 15),

                    // زرار إضافة عضو آخر
                    _buildSecondaryButton(context),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // كارت معاينة الموظف اللي ضفتيه
  Widget _buildMemberPreviewCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/image/dr1.png'),
          ),
          const SizedBox(height: 12),
          const Text('Dr. Ahmed Mohamed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const Text('ORTHOPEDIC SURGEON', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFFE0F2FE), borderRadius: BorderRadius.circular(6)),
            child: const Text('ID: 4492', style: TextStyle(color: Color(0xFF0369A1), fontSize: 10, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.business, size: 14, color: Color(0xFF94A3B8)),
              SizedBox(width: 5),
              Text('Surgery Dept.', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
              SizedBox(width: 15),
              Icon(Icons.access_time, size: 14, color: Color(0xFF94A3B8)),
              SizedBox(width: 5),
              Text('Full-Time', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFF8BA68D), Color(0xFFCBD5A5)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          // الربط الصحيح عشان يفتح الصفحة اللي إنتي بعتي كودها
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StaffDirectoryPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text(
          'View Directory',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: () => Navigator.pop(context), // بيرجع لصفحة الفورم عشان يضيف حد تاني
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFFE2E8F0)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text('+ Add Another Member', style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildFooter() {
    return const Column(
      children: [
        Text('MEDICAL CENTER ADMINISTRATION', style: TextStyle(fontSize: 9, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
        Text('SYSTEM • CLINICAL DIRECTORY V2.4', style: TextStyle(fontSize: 9, color: Color(0xFF94A3B8))),
      ],
    );
  }
}