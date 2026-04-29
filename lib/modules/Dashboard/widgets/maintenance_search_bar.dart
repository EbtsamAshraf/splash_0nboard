import 'package:flutter/material.dart';

class MaintenanceSearchBar extends StatelessWidget {
  const MaintenanceSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: const Color(0xffE6EAED), borderRadius: BorderRadius.circular(15)),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Find patient...",
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}