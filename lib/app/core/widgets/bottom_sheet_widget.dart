import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bottomSheetWidget(BuildContext context, String str, Widget widget) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          clipBehavior: Clip.none,
           children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
              height: 350.h,
              child: widget),
          Positioned(
              top: -40.h,
              right: MediaQuery.of(context).size.width / 3,
              child: SizedBox(
                height: 100.h,
                width: 100.w,
                child: FloatingActionButton(
                  backgroundColor:  Colors.transparent,
                  onPressed: () {},
                  child: SvgPicture.asset(str),
                ),
              )),
        ]),
      );
    },
  );
}
