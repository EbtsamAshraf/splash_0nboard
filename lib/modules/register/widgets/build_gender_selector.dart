import 'package:flutter/material.dart';

import 'genderButton.dart';

Widget buildGenderSelector() {
  return Row(
    children: [
      Expanded(child: genderButton("Female", true)),
      const SizedBox(width: 10),
      Expanded(child: genderButton("Male", false)),
      const SizedBox(width: 10),
      Expanded(child: genderButton("Other", false)),
    ],
  );
}