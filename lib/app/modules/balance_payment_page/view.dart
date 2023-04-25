import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:second_task/app/core/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task/app/core/widgets/custom_button.dart';
import 'package:second_task/app/modules/signup_page/controller.dart';

import '../signup_page/view.dart';

class BalancePayment3 extends StatelessWidget {
  const BalancePayment3({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text(
            "سداد رصيد",
          ),
          actions: [
            SvgPicture.asset("assets/icons/help_icon.svg",
                height: 40.w, width: 40.w, fit: BoxFit.scaleDown),
          ],
          leading: const Icon(Icons.arrow_back_ios),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/payment_logo.png"),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("رقم الجوال",
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 200.w,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              hintStyle: Theme.of(context).textTheme.labelSmall,
                              hintText: "ادخل رقم الجوال",
                              fillColor: const Color(0xFFF8F9FB),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                                width: 1.0, color: Color(0xFF8E8E93)),
                          ),
                          activeColor: primaryColor,
                          value: signUpController.isChecked.value,
                          onChanged: (value) {
                            signUpController.toggleChecked();
                          },
                        ),
                      ),
                      Text(
                        "حفظ الرقم",
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  ),
                  _buildGenderSection(signUpController, context),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "الباقات المتاحة",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildPaymentMethold(),
                            _buildPaymentMethold(),
                            _buildPaymentMethold()
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildPaymentMethold(),
                            _buildPaymentMethold(),
                            _buildPaymentMethold()
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildPaymentMethold() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color(0xFFffe5d8),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          width: 90.w,
          height: 50.h,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "48.95",
              style: TextStyle(color: const Color(0xFFF58042), fontSize: 13.sp),
            ),
          )),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Color(0xFFF58042),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          width: 90.w,
          height: 40.h,
          child: Center(
              child: Text(
            "500 ر.ي",
            style: TextStyle(color: Colors.white, fontSize: 13.sp),
          )),
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
                  'فاتورة',
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
                  'دفع مسبق',
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
}




class BalancePayment2 extends StatelessWidget {
  const BalancePayment2({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text(
            "سداد رصيد",
          ),
          actions: [
            SvgPicture.asset("assets/icons/help_icon.svg",
                height: 40.w, width: 40.w, fit: BoxFit.scaleDown),
          ],
          leading: const Icon(Icons.arrow_back_ios),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/payment_logo.png"),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("رقم الجوال",
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 200.w,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              hintStyle: Theme.of(context).textTheme.labelSmall,
                              hintText: "ادخل رقم الجوال",
                              fillColor: const Color(0xFFF8F9FB),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                      ),
                      buildCustomButton(context, () {}, 80.h, "استعلام"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                                width: 1.0, color: Color(0xFF8E8E93)),
                          ),
                          activeColor: primaryColor,
                          value: signUpController.isChecked.value,
                          onChanged: (value) {
                            signUpController.toggleChecked();
                          },
                        ),
                      ),
                      Text(
                        "حفظ الرقم",
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  ),
                  _buildGenderSection(signUpController, context), 
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: _buildRowWidget("المبلغ", "ادخل المبلغ ", context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "يمكنك تسديد اي مبلغ وليس المبلغ المطلوب",
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  buildCustomButton(context, () {}, 300.w, "سداد 500  ر.ي"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildGenderSection(SignUpController signUpController, BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Obx(() => RadioListTile<Gender>(
                title: Text(
                  'فاتورة',
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
                  'دفع مسبق',
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

  _buildRowWidget(String str1, subStr1, BuildContext context) {
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
          width: 7.w,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: DropDownWidget(title: "العملة", subTitle: "حدد العملة"),
              ),
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






class BalancePayment1 extends StatelessWidget {
  const BalancePayment1({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text(
            "سداد رصيد",
          ),
          actions: [
            SvgPicture.asset("assets/icons/help_icon.svg",
                height: 40.w, width: 40.w, fit: BoxFit.scaleDown),
          ],
          leading: const Icon(Icons.arrow_back_ios),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/payment_logo.png"),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("رقم الجوال",
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 200.w,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              hintStyle: Theme.of(context).textTheme.labelSmall,
                              hintText: "ادخل رقم الجوال",
                              fillColor: const Color(0xFFF8F9FB),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20.0),
                            ),
                          ),
                        ),
                      ),
                      buildCustomButton(context, () {}, 80.h, "استعلام"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                                width: 1.0, color: Color(0xFF8E8E93)),
                          ),
                          activeColor: primaryColor,
                          value: signUpController.isChecked.value,
                          onChanged: (value) {
                            signUpController.toggleChecked();
                          },
                        ),
                      ),
                      Text(
                        "حفظ الرقم",
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: Theme.of(context).textTheme.labelSmall,
                        hintText: "الرصيد 77.7",
                        fillColor: const Color(0xFFF8F9FB),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 17.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: _buildRowWidget("المبلغ", "ادخل المبلغ ", context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "يمكنك تسديد اي مبلغ وليس المبلغ المطلوب",
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  buildCustomButton(context, () {}, 300.w, "سداد 500  ر.ي"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildRowWidget(String str1, subStr1, BuildContext context) {
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
          width: 7.w,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: DropDownWidget(title: "العملة", subTitle: "حدد العملة"),
              ),
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

