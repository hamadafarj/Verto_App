import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task/app/core/values/colors.dart';

buildCustomButton(
    BuildContext context, Function function, var width, String str) {
  return GestureDetector(
    onTap: () => function,
    child: Container(
      width: width,
      height: 45.h,
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: Colors.white,
          )),
      child: Center(
        child: Text(
          str,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    ),
  );
}
