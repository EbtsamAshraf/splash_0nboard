import 'package:flutter/animation.dart';
import 'package:splash_0nboard/core/them/app_colors.dart';

class UserRoleModel {
  final String title;
  final String image;
  final Color color;

  const UserRoleModel({
    required this.title,
    required this.image,
    required this.color,
  });

  static const List<UserRoleModel> roles = [
    UserRoleModel(
      title: "Doctor",
      image: "assets/image/doctor.png",
      color: AppColor.moveColor,
    ),
    UserRoleModel(
      title: "Patient",
      image: "assets/image/patint.png",
      color: AppColor.blueColor,
    ),
    UserRoleModel(
      title: "Factory",
      image: "assets/image/factory.png",
      color: AppColor.greenColor,
    ),
    UserRoleModel(
      title: "Technical",
      image: "assets/image/technical.png",
      color: AppColor.orangColor,
    ),
  ];
}
