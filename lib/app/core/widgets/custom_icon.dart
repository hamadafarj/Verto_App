import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task/app/core/values/colors.dart';

Widget notification() {
  return Container(
    width: 38.w,
    height: 38.h,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(.2),
      border: Border.all(
        color: Colors.white,
        width: 1,
      ),
      shape: BoxShape.circle,
    ),
    child: Center(
      child: Stack(
        children: [
          Container(
            width: 5.w,
            height: 5.h,
            decoration: const BoxDecoration(
              color: star,
              shape: BoxShape.circle,
            ),
          ),
          const Icon(
            Icons.notifications_outlined,
          ),
        ],
      ),
    ),
  );
}
