import 'package:flutter/material.dart';

import 'AddNewMemberPage.dart';

class TechnicianProfilePage extends StatelessWidget {
  const TechnicianProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF7DA48D)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Technician Profile',
          style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.more_vert, color: Color(0xFF1E293B)), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // 1. صورة البروفايل بالبرواز المتدرج
          // استبدلي الدائرة الفاضية (CircleAvatar) بهذا الجزء:
          Center(
            child: Container(
              padding: const EdgeInsets.all(4), // سمك البرواز الأخضر
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFF7DA48D), Color(0xFFBCD4C5)], // درجات الأخضر من التصميم
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(2), // مسافة بيضاء صغيرة بين البرواز والصورة
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const CircleAvatar(
                  radius: 60, // حجم الصورة
                  backgroundColor: Color(0xFFF1F5F9),
                  backgroundImage: AssetImage('assets/image/dr1.png'), // حطي هنا مسار الصورة الصح
                ),
              ),
            ),

            ),
            const SizedBox(height: 15),

            // 2. الاسم والمسمى الوظيفي
            const Text(
              'Alex Rivera',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 5),
            const Text(
              'Senior Prosthetic Technician',
              style: TextStyle(fontSize: 14, color: Color(0xFF7DA48D), fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),

            // 3. التاجات (Tags)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBadge('Certified Expert', const Color(0xFFE0E7FF), const Color(0xFF4338CA)),
                const SizedBox(width: 10),
                _buildBadge('Lower Limb Specialist', const Color(0xFFF1F5F9), const Color(0xFF64748B)),
              ],
            ),
            const SizedBox(height: 30),

            // 4. كروت الإحصائيات (Rating & Experience)
            Row(
              children: [
                Expanded(child: _buildStatCard('4.9', 'RATING', Icons.star)),
                const SizedBox(width: 15),
                Expanded(child: _buildStatCard('12', 'YEARS EXPERIENCE', null)),
              ],
            ),
            const SizedBox(height: 15),
            _buildStatCard('+450', 'COMPLETED CASES', null, isFullWidth: true),

            const SizedBox(height: 30),

            // 5. قسم الخبرات التقنية (Technical Specialties)
            _buildSectionHeader(Icons.settings_outlined, 'Technical Specialties'),
            const SizedBox(height: 10),
            _buildSpecialtyItem('Socket design'),
            _buildSpecialtyItem('Carbon fiber molding'),
            _buildSpecialtyItem('Smart bionic calibration'),

            const SizedBox(height: 30),

            // 6. أزرار التحكم
            // 6. أزرار التحكم
            ElevatedButton(
              onPressed: () {
                // الكود اللي بيفتح صفحة الشات
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNewMemberPage ()), // تأكدي من اسم صفحة الشات عندك
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7DA48D).withOpacity(0.2),
                foregroundColor: const Color(0xFF1E293B),
                elevation: 0,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_outlined, size: 20),
                  const SizedBox(width: 10),
                  Text('Start Instant Chat', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFE2E8F0),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              child: const Text('BACK', style: TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ميثود بناء الـ Badge
  Widget _buildBadge(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  // ميثود بناء كارت الإحصائيات
  Widget _buildStatCard(String value, String label, IconData? icon, {bool isFullWidth = false}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, color: Colors.orange, size: 20),
              if (icon != null) const SizedBox(width: 5),
              Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            ],
          ),
          const SizedBox(height: 5),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // ميثود بناء عنوان القسم
  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF7DA48D), size: 22),
        const SizedBox(width: 10),
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
      ],
    );
  }

  // ميثود بناء عناصر التخصص
  Widget _buildSpecialtyItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, bottom: 8),
      child: Row(
        children: [
          Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF7DA48D), shape: BoxShape.circle)),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: Color(0xFF64748B), fontSize: 14)),
        ],
      ),
    );
  }
}