import 'package:flutter/material.dart';

import '../../../../core/them/app_colors.dart';


class LoginHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.blueColor,
            AppColor.blueColor,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CircleAvatar(
            radius: 35,
            backgroundColor: AppColor.whitColor,
            child: Image.asset(
              "assets/image/avatar.png",
              width:100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "Step Again",
            style: TextStyle(
              color: AppColor.whitColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}