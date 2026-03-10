import 'package:flutter/material.dart';

Widget genderButton(String text, bool isSelected) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16),
      side: BorderSide(
        color: isSelected ? const Color(0xff3b6ef5) : Colors.grey.shade200,
        width: isSelected ? 2 : 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: () {},
    child: Text(
      text,
      style: TextStyle(
        color: isSelected ? const Color(0xff3b6ef5) : Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
