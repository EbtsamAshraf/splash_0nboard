import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalAnalyticsView extends StatelessWidget {
  const MedicalAnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 30),
            // الكروت الأساسية اللي عملناها قبل كدة
            _buildStatCard("TOTAL UNITS", "Total Orders", "1,284", "+12%", Icons.inventory_2_outlined, const Color(0xffE0E7FF)),
            const SizedBox(height: 20),
            _buildStatCard("Completed", "Delivered Orders", "1,102", "86% of Total", Icons.check_circle_outline, const Color(0xffECFDF5), statusColor: Colors.green),
            const SizedBox(height: 20),
            _buildStatCard("Warning", "Delayed Orders", "42", "Needs Intervention", Icons.assignment_late_outlined, const Color(0xffFEF2F2), statusColor: Colors.red),

            const SizedBox(height: 30),
            // الجزء الجديد: Center Growth Index
            _buildGrowthIndexCard(),

            const SizedBox(height: 30),
            // الجزء الجديد: Patient Ratings
            _buildRatingsCard(),

            const SizedBox(height: 30),
            // الجزء الجديد: Sentiment Analysis
            _buildSentimentAnalysis(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ميثود بناء الجزء العلوي (العنوان والوصف)
  Widget _buildHeader() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.analytics_outlined, color: Colors.orange[300], size: 20),
          const SizedBox(width: 8),
          const Text("OVERVIEW", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
      const SizedBox(height: 10),
      const Text("Medical\nPerformance\nAnalytics", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, height: 1.1)),
      const SizedBox(height: 20),
      Text("Precision tracking of performance metrics and growth to ensure optimal patient care quality.",
          style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.5)),
    ],
  );

  // كارت الـ Growth Index بتصميم الـ Gradient
  Widget _buildGrowthIndexCard() => Container(
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff789376), Color(0xffAFC8AE), Color(0xffE9E1B3)],
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Center Growth Index", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 10),
        Text("Consistent growth in operational efficiency by 24% during the current quarter.",
            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12)),
        const SizedBox(height: 25),
        const Row(
          children: [
            Icon(Icons.trending_up, color: Colors.white, size: 28),
            SizedBox(width: 10),
            Text("+24.8%", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(value: 0.7, backgroundColor: Colors.white.withOpacity(0.3), color: Colors.white),
        const SizedBox(height: 5),
        const Text("TARGET: 30% GROWTH", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    ),
  );

  // كارت الـ Patient Ratings والنجوم
  Widget _buildRatingsCard() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Patient Ratings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const Text("Customer satisfaction analysis based on 450 recent reviews.", style: TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 20),
        const Row(
          children: [
            Text("4.8", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(width: 10),
            Row(children: [Icon(Icons.star, color: Colors.amber, size: 20), Icon(Icons.star, color: Colors.amber, size: 20), Icon(Icons.star, color: Colors.amber, size: 20), Icon(Icons.star, color: Colors.amber, size: 20), Icon(Icons.star_half, color: Colors.amber, size: 20)]),
          ],
        ),
        const SizedBox(height: 20),
        _ratingBar("5", 0.85, "85%"),
        _ratingBar("4", 0.10, "10%"),
        _ratingBar("3", 0.03, "3%"),
      ],
    ),
  );

  Widget _ratingBar(String label, double val, String percent) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        Expanded(child: LinearProgressIndicator(value: val, backgroundColor: Colors.grey[200], color: const Color(0xff789376))),
        const SizedBox(width: 10),
        Text(percent, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    ),
  );

  // جزء الـ Sentiment Analysis اللي في آخر الصفحة
  Widget _buildSentimentAnalysis() => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("GENERAL SENTIMENT ANALYSIS", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
        const SizedBox(height: 15),
        _sentimentItem(Icons.sentiment_satisfied_alt, "Highly Positive", "Most patients praise the response speed and efficiency.", Colors.green[50]!, Colors.green),
        const SizedBox(height: 15),
        _sentimentItem(Icons.lightbulb_outline, "Improvement Opportunities", "Waiting times in the central clinic were mentioned.", Colors.blue[50]!, Colors.blue),
      ],
    ),
  );

  Widget _sentimentItem(IconData icon, String title, String sub, Color bg, Color iconCol) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(15)),
    child: Row(
      children: [
        Icon(icon, color: iconCol),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: iconCol)), Text(sub, style: const TextStyle(fontSize: 11, color: Colors.black54))])),
      ],
    ),
  );

  // AppBar والـ StatCard موجودين من الكود السابق
  PreferredSizeWidget _buildAppBar() => AppBar(
    backgroundColor: Colors.transparent, elevation: 0,
    leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () => Get.back()),
    actions: const [Padding(padding: EdgeInsets.only(right: 15), child: CircleAvatar(radius: 18, backgroundColor: Color(0xff789376), child: Text("CP", style: TextStyle(color: Colors.white, fontSize: 12))))],
  );

  Widget _buildStatCard(String tag, String title, String value, String subtitle, IconData icon, Color iconBg, {Color? statusColor}) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: statusColor ?? const Color(0xff4338CA), size: 20)), Text(tag, style: TextStyle(color: statusColor ?? Colors.grey, fontWeight: FontWeight.bold, fontSize: 10))]),
        const SizedBox(height: 20),
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 5),
        Row(children: [Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), const SizedBox(width: 10), Text(subtitle, style: TextStyle(color: statusColor ?? Colors.green, fontSize: 12, fontWeight: FontWeight.w600))]),
      ],
    ),
  );
}