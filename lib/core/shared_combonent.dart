import 'package:flutter/material.dart';
import 'package:splash_0nboard/core/them/app_colors.dart';

Widget buildTextField(
  String label,
  String hint, {
  bool isDate = false,
  TextEditingController? controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: AppColor.fontColor,
        ),
      ),
      const SizedBox(height: 8),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColor.greyColor, fontSize: 14),
          filled: true,
          fillColor: AppColor.feaild,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.feaild, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColor.green, width: 1.5),
          ),
          suffixIcon: isDate
              ? const Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: AppColor.greyColor,
                )
              : null,
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}

// 2. الزرار الرئيسي بالتدرج اللوني (Gradient Button)
class BuildMainButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const BuildMainButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColor.greenDark, AppColor.beige],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColor.greenDark.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

// 3. الفاصل (Divider)
Widget buildDivider() {
  return Row(
    children: [
      const Expanded(child: Divider(color: AppColor.greyColor)),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          "or",
          style: TextStyle(color: AppColor.greyColor, fontSize: 16),
        ),
      ),
      const Expanded(child: Divider(color: AppColor.greyColor)),
    ],
  );
}
