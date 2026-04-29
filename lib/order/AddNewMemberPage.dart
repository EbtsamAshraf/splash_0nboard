import 'package:flutter/material.dart';

import 'MemberSuccessPage.dart';

class AddNewMemberPage extends StatelessWidget {
  const AddNewMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF1E293B)),
          onPressed: () {},
        ),
        title: const Text(
          'Clinical Directory',
          style: TextStyle(color: Color(0xFF1E293B), fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/image/dr1.png'), // صورتك الشخصية
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('STAFF MANAGEMENT',
                style: TextStyle(color: Color(0xFF7DA48D), fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
            const SizedBox(height: 8),
            const Text('Add New Member',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Color(0xFF1E293B))),
            const SizedBox(height: 12),
            const Text(
              'Enter new staff details accurately to ensure medical records and efficient scheduling are updated.',
              style: TextStyle(color: Color(0xFF64748B), fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 30),

            // كارت رفع الصورة
            _buildUploadPhotoCard(),

            const SizedBox(height: 25),

            // فورم البيانات
            _buildInputSection(),

            const SizedBox(height: 30),

            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel Process',
                    style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
              ),
            ),
            const SizedBox(height: 15),

            // الزرار المتدرج (Save New Member)
            _buildSaveButton(context),

            const SizedBox(height: 40),

            // الفوتر الصغير اللي تحت خالص
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadPhotoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Column(
        children: [
          // دائرة الرفع المنقطة
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFF59E0B).withOpacity(0.3), style: BorderStyle.solid),
            ),
            child: const Column(
              children: [
                Icon(Icons.camera_alt_outlined, color: Color(0xFF94A3B8), size: 35),
                SizedBox(height: 5),
                Text('Upload Photo', style: TextStyle(fontSize: 10, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('Maximum file size 2MB. Supported formats: JPG, PNG.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildInputSection() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField('FULL NAME', 'e.g., Dr. Ahmed Mohamed'),
          _buildTextField('JOB TITLE', 'e.g., Orthopedic Surgeon'),
          _buildDropdownField('ROLE TYPE', 'Choose Role...'),
          _buildTextField('SPECIALTY', 'e.g., Artificial Limbs'),
          _buildTextField('YEARS OF EXPERIENCE', '0'),
          _buildTextField('ADDITIONAL NOTES (OPTIONAL)', 'Any other medical or administrative details...', maxLines: 3),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          const SizedBox(height: 8),
          TextFormField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
              filled: true,
              fillColor: const Color(0xFFF1F5F9),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(12)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text(hint, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13)),
                items: const [],
                onChanged: (val) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ضفنا الـ BuildContext هنا عشان نقدر نستخدم الـ Navigator
  Widget _buildSaveButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [Color(0xFF8BA68D), Color(0xFFCBD5A5)], // التدرج الأخضر اللي في الصورة
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          // ده الكود اللي هينقلك لصفحة النجاح فوراً
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MemberSuccessPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Save New Member',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)
            ),
            SizedBox(width: 10),
            Icon(Icons.save_outlined, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.shield_outlined, size: 14, color: Color(0xFF94A3B8)),
        SizedBox(width: 8),
        Text(
          'ENCRYPTED MEDICAL DATA MANAGEMENT SYSTEM',
          style: TextStyle(color: Color(0xFF94A3B8), fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
      ],
    );
  }
}