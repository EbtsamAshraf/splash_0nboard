import 'package:flutter/material.dart';
import 'TechnicianProfilePage.dart'; // تأكدي أن اسم الملف مطابق تماماً

class StaffDirectoryPage extends StatelessWidget {
  const StaffDirectoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Medical Staff Management',
          style: TextStyle(color: Color(0xFF7DA48D), fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Staff Directory',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manage and track the performance of your advanced medical center staff.',
              style: TextStyle(color: Color(0xFF64748B), fontSize: 14, height: 1.4),
            ),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 25),

            // عرض كروت الموظفين
            _buildStaffCard(
              context,
              name: 'Dr. Samir Al-Mansour',
              role: 'DOCTOR',
              imagePath: 'assets/image/dr1.png',
              rating: 4,
              experience: '12 Years',
              status: 'Active',
            ),
            _buildStaffCard(
              context,
              name: 'Laila Al-Harbi',
              role: 'TECHNICIAN',
              imagePath: 'assets/image/dr2.png',
              rating: 5,
              experience: '5 Years',
              status: 'On Leave',
            ),
            _buildStaffCard(
              context,
              name: 'Dr. Khalid Al-Faisal',
              role: 'DOCTOR',
              imagePath: 'assets/image/drr.png',
              rating: 3,
              experience: '8 Years',
              status: 'Active',
            ),

            const SizedBox(height: 10),
            _buildAddNewStaffButton(),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF8BA68D),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // --- ميثود بناء كارت الموظف ---
  Widget _buildStaffCard(
      BuildContext context, {
        required String name,
        required String role,
        required int rating,
        required String experience,
        required String status,
        required String imagePath,
      }) {
    Color statusColor = status == 'Active' ? Colors.green : Colors.orange;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // 1. صورة البروفايل مع الظل
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color(0xFFF1F5F9),
                  backgroundImage: AssetImage(imagePath),
                ),
              ),
              const SizedBox(width: 15),

              // 2. الاسم والوظيفة
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 6),
                    _buildRoleTag(role),
                  ],
                ),
              ),

              // 3. أيقونات التعديل والحذف
              const Icon(Icons.edit_outlined, color: Color(0xFFF59E0B), size: 22),
              const SizedBox(width: 12),
              const Icon(Icons.delete_outline, color: Color(0xFFF59E0B), size: 22),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFFF1F5F9)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoColumn(
                'RATING',
                Row(
                  children: List.generate(
                    5,
                        (i) => Icon(
                      Icons.star,
                      size: 14,
                      color: i < rating ? const Color(0xFFF59E0B) : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
              _infoColumn(
                'EXPERIENCE',
                Text(experience, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 4, backgroundColor: statusColor),
                  const SizedBox(width: 8),
                  Text(
                    status,
                    style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TechnicianProfilePage()),
                  );
                },
                child: const Text(
                  'View Profile',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRoleTag(String role) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E7FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        role,
        style: const TextStyle(color: Color(0xFF4338CA), fontSize: 10, fontWeight: FontWeight.w900),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
        ],
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Color(0xFF94A3B8)),
          hintText: 'Search for a doctor or technician...',
          hintStyle: TextStyle(color: Color(0xFF94A3B8), fontSize: 13),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildAddNewStaffButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFCBD5E1), width: 1.5),
      ),
      child: const Column(
        children: [
          Icon(Icons.person_add_outlined, color: Color(0xFF94A3B8), size: 30),
          SizedBox(height: 10),
          Text('Add New Staff', style: TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _infoColumn(String label, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 10, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        content,
      ],
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF8BA68D),
      unselectedItemColor: const Color(0xFF94A3B8),
      currentIndex: 2,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'HOME'),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'ORDERS'),
        BottomNavigationBarItem(icon: Icon(Icons.build_outlined), label: 'MAINTENANCE'),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'MESSAGES'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'PROFILE'),
      ],
    );
  }
}