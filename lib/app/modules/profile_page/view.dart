import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:second_task/app/core/values/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("الملف الشخصي"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 120.h,
                color: primaryColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                        maxRadius: 25,
                        backgroundImage:
                            AssetImage("assets/images/profile_image.png")),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "استاذ محيي",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "059465566",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 80.0,
                right: 40,
                left: 40,
                child: Container(
                  height: 200.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/favorite.svg",
                                height: 18.h,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              const Text("المفضلة")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/personal_icon.svg",
                              ),
                              SizedBox(
                                height: 11.h,
                              ),
                              const Text("المعلومات الشخصية")
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/setting_icon.svg",
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              const Text("الاعدادات")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      ProfileRowWidget(
                        str: "من نحن",
                        iconPath: "assets/icons/about_us_icon.svg",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ProfileRowWidget(
                        str: "سياسة الاستخدام",
                        iconPath: "assets/icons/policy_icon.svg",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ProfileRowWidget(
                        str: "اسئلة شائعة",
                        iconPath: "assets/icons/question_icon.svg",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ProfileRowWidget(
                        str: "دعوة اصدقاء",
                        iconPath: "assets/icons/invitation_icon.svg",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ProfileRowWidget(
                        str: "المساعدة",
                        iconPath: "assets/icons/help_icons.svg",
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/logout_icon.svg",
                            colorFilter: const ColorFilter.mode(
                              Colors.red,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          const Text(
                            "تسجيل الخروج ",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ProfileRowWidget extends StatelessWidget {
  String str, iconPath;
  ProfileRowWidget({super.key, required this.str, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              iconPath,
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(str)
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
