import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GenderController genderController = Get.put(GenderController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.h),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/logo.svg"),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                        child: Text(
                      "انشاء حساب",
                      style: TextStyle(
                        color: const Color(0xFF20225C),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        fontFamily: 'FFShamelFamily',
                      ),
                    )),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildRowWidget(
                        "الاسم", "ادخل الاسم ", "اسم الاب", "ادخل اسم الاب"),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildRowWidget(
                        "الجد", "ادخل اسم الجد ", "اللقب", "ادخل اللقب"),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildGenderSection(),
                    SizedBox(
                      height: 15.h,
                    ),
                    _buildTextWidget("الرقم الجوال", "ادخل رقم الجوال"),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildTextWidget("الرقم الهوية", "ادخل رقم الهوية"),
                    const DropDownWidget(
                        title: "الدوله", subTitle: "قم بتحديد الدولة"),
                    SizedBox(
                      height: 10.h,
                    ),
                    const DropDownWidget(
                        title: "المحافظة", subTitle: "قم بتحديد المحافظة"),
                    CheckboxListTile(
                      title: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'الموافقة على ',
                                style: TextStyle(color: Color(0xFFACACAC))),
                            TextSpan(
                                text: 'سياسة و الشروط الاستخدام',
                                style: TextStyle(color: Color(0xFF20225C))),
                          ],
                        ),
                      ),
                      value: false,
                      onChanged: (newValue) {},
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 240.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF58042),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          )),
                      child: Center(
                        child: Text(
                          'انشاء حساب',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'لدي حساب؟',
                                  style: TextStyle(
                                    color: Color(0xFFACACAC),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    fontFamily: 'FFShamelFamily',
                                  )),
                              TextSpan(
                                  text: "  تسجيل الدخول",
                                  style: TextStyle(
                                    color:  Color(0xFFF58042),
                                      fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    fontFamily: 'FFShamelFamily',
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTextWidget(String text, hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF20225C),
            fontWeight: FontWeight.bold,
            fontSize: 13.sp,
            fontFamily: 'FFShamelFamily',
          ),
        ),
        _buildTextFiled(hint)
      ],
    );
  }

  _buildGenderSection() {
    final GenderController genderController = Get.put(GenderController());

    return Row(
      children: <Widget>[
        Expanded(
          child: Obx(() => RadioListTile<Gender>(
                title: Text(
                  'ذكر',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: 'FFShamelFamily',
                    color: genderController.gender.value == Gender.male
                        ? const Color(0xFFF58042)
                        : const Color(0xFF20225C),
                  ),
                ),
                value: Gender.male,
                activeColor: const Color(0xFFF58042),
                groupValue: genderController.gender.value,
                onChanged: (value) {
                  genderController.setGender(value!);
                },
              )),
        ),
        Expanded(
          child: Obx(() => RadioListTile<Gender>(
                title: Text(
                  'انتى',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: 'FFShamelFamily',
                    color: genderController.gender.value == Gender.female
                        ? const Color(0xFFF58042)
                        : const Color(0xFF20225C),
                  ),
                ),
                value: Gender.female,
                activeColor: const Color(0xFFF58042),
                groupValue: genderController.gender.value,
                onChanged: (value) {
                  genderController.setGender(value!);
                },
              )),
        ),
      ],
    );
  }

  _buildRowWidget(
    String str1,
    subStr1,
    str2,
    subStr2,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                str1,
                style: TextStyle(
                  color: const Color(0xFF20225C),
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  fontFamily: 'FFShamelFamily',
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              _buildTextFiled(subStr1)
            ],
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                str2,
                style: TextStyle(
                  color: const Color(0xFF20225C),
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  fontFamily: 'FFShamelFamily',
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              _buildTextFiled(subStr2)
            ],
          ),
        ),
      ],
    );
  }

  _buildTextFiled(String hintText) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(20.0),
          ),
          filled: true,
          hintStyle: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey[400],
              fontFamily: "FFShamelFamily"),
          hintText: hintText,
          fillColor: const Color(0xFFF8F9FB)),
    );
  }
}

class DropDownWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const DropDownWidget(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: const Color(0xFF20225C),
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                fontFamily: 'FFShamelFamily',
              ),
            )
          ],
        ),
        Container(
          height: 40.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFF8F9FB)),
          child: Center(
            child: DropdownButtonFormField<String>(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("assets/icons/dropDown_icon.svg"),
              ),
              focusNode: FocusNode(canRequestFocus: false),
              decoration: const InputDecoration.collapsed(hintText: ''),
              hint: Padding(
                padding: EdgeInsets.only(right: 8.w, left: 8.w),
                child: Text(
                  subTitle,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.grey[400],
                      fontFamily: "FFShamelFamily"),
                ),
              ),
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
            ),
          ),
        )
      ],
    );
  }
}
