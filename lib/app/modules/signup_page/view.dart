import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:second_task/app/core/values/colors.dart';
import 'package:second_task/app/modules/home_page/view.dart';
import 'controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());

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
                      style: Theme.of(context).textTheme.headlineLarge,
                    )),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildRowWidget("الاسم", "ادخل الاسم ", "اسم الاب",
                        "ادخل اسم الاب", context),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildRowWidget("الجد", "ادخل اسم الجد ", "اللقب",
                        "ادخل اللقب", context),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    _buildGenderSection(signUpController, context),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildTextWidget(
                        "الرقم الجوال", "ادخل رقم الجوال", context),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildTextWidget(
                        "الرقم الهوية", "ادخل رقم الهوية", context),
                    SizedBox(
                      height: 10.h,
                    ),
                    const DropDownWidget(
                        title: "الدوله", subTitle: "قم بتحديد الدولة"),
                    SizedBox(
                      height: 10.h,
                    ),
                    const DropDownWidget(
                        title: "المحافظة", subTitle: "قم بتحديد المحافظة"),
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildCheckBoxWidget(signUpController, context),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => const HomePage()),
                      child: Container(
                        width: 240.w,
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
                            'انشاء حساب',
                            style: Theme.of(context).textTheme.headlineMedium,
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
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'لدي حساب؟',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: "  تسجيل الدخول",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
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

  _buildTextWidget(String text, hint, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: Theme.of(context).textTheme.labelMedium),
        _buildTextFiled(hint, context)
      ],
    );
  }

  _buildCheckBoxWidget(
      SignUpController signUpController, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(
          () => Checkbox(
            activeColor: primaryColor,
            value: signUpController.isChecked.value,
            onChanged: (value) {
              signUpController.toggleChecked();
            },
          ),
        ),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'الموافقة على ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: 'سياسة و الشروط الاستخدام',
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }

  _buildGenderSection(SignUpController signUpController, BuildContext context) {
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
                      color: signUpController.gender.value == Gender.male
                          ? primaryColor
                          : secondary),
                ),
                value: Gender.male,
                activeColor: primaryColor,
                groupValue: signUpController.gender.value,
                onChanged: (value) {
                  signUpController.setGender(value!);
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
                      color: signUpController.gender.value == Gender.female
                          ? primaryColor
                          : secondary),
                ),
                value: Gender.female,
                activeColor: primaryColor,
                groupValue: signUpController.gender.value,
                onChanged: (value) {
                  signUpController.setGender(value!);
                },
              )),
        ),
      ],
    );
  }

  _buildRowWidget(String str1, subStr1, str2, subStr2, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(str1, style: Theme.of(context).textTheme.labelMedium),
              SizedBox(
                height: 3.h,
              ),
              _buildTextFiled(subStr1, context)
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
              Text(str2, style: Theme.of(context).textTheme.labelMedium),
              SizedBox(
                height: 3.h,
              ),
              _buildTextFiled(subStr2, context)
            ],
          ),
        ),
      ],
    );
  }

  _buildTextFiled(String hintText, BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        hintText: hintText,
        fillColor: const Color(0xFFF8F9FB),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
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
                color: secondary,
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
              decoration: const InputDecoration.collapsed(
                hintText: '',
              ),
              hint: Padding(
                padding: EdgeInsets.only(right: 8.w, left: 8.w),
                child: Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelSmall,
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
