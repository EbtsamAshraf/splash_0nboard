import 'package:flutter/material.dart';

Widget buildProfilePhoto() {
  return Center(
    child: Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xffF2F4F7),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, size: 50, color: Colors.grey),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Color(0xff3b6ef5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 20),
          ),
        ),
      ],
    ),
  );
}
