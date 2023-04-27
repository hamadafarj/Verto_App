import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task/app/core/values/colors.dart';
import 'custom_icon.dart';

customAppBar(String title) {
  return AppBar(
    actions: [
      Container(
        margin: EdgeInsets.only(left: 22.w),
        child: notification(),
      )
    ],
    backgroundColor: primaryColor,
    centerTitle: true,
    title: Text(title),
    elevation: 0,
  );
}
