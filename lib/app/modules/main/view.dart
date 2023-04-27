import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:second_task/app/core/values/colors.dart';
import 'package:second_task/app/modules/home_page/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Main extends StatelessWidget {
  Main({super.key});

  final iconList = [
    "assets/icons/home_icon.svg",
    "assets/icons/favorite.svg",
    "assets/icons/statistics.svg",
    "assets/icons/personal_icon.svg",
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Obx(() =>
              controller.widgets[controller.currentIndex.value]["Widget"]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          child: const Icon(Icons.apps),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(
          () => AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  SvgPicture.asset(
                      height: 18.h,
                      width: 18.h,
                    iconList[index],
                    colorFilter: ColorFilter.mode(
                      isActive ? primaryColor : hint,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(height: 15.h),
                ],
              );
            },
            activeIndex: controller.currentIndex.toInt(),
            splashSpeedInMilliseconds: 300,
            notchSmoothness: NotchSmoothness.defaultEdge,
            gapLocation: GapLocation.center,
            onTap: (index) => controller.changeTab(index.toInt()),
          ),
        ),
      ),
    );
  }
}

// class Main extends GetView<HomeController> {
//   const Main({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Stack(
//             children: [
//               Obx(() => IndexedStack(
//                     index: controller.tabIndex.value,
//                     children: controller.widgets
//                         .map((e) => Container(
//                               child: e["Widget"],
//                             ))
//                         .toList(),
//                   )),
//             ],
//           ),
//         ),
//         bottomNavigationBar: bottomNavigation(),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: primaryColor,
//           child: const Icon(Icons.apps),
//           onPressed: () {},
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       ),
//     );
//   }
// }

Widget bottomNavigation() {
  final controller = Get.put(HomeController());
  return Container(
    height: 60.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    ),
    child: Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: controller.tabIndex.value,
          onTap: (index) => controller.changeTab(index),
          selectedItemColor: primaryColor,
          unselectedItemColor: hint,
          iconSize: 24.h,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                width: controller.tabIndex.toInt() == 0 ? 70.w : 60,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/home_icon.svg",
                      height: 18.h,
                      width: 18.h,
                      colorFilter: ColorFilter.mode(
                        controller.tabIndex.toInt() == 0 ? primaryColor : hint,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    controller.tabIndex.toInt() == 0
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "الرئيسية",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10.sp, color: primaryColor),
                            ),
                          )
                        : const Text(""),
                  ],
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: controller.tabIndex.toInt() == 1 ? 70.w : 60,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/favorite.svg",
                      height: 18.h,
                      width: 18.h,
                      colorFilter: ColorFilter.mode(
                        controller.tabIndex.toInt() == 1 ? primaryColor : hint,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    controller.tabIndex.toInt() == 1
                        ? Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "الرئيسية",
                              style: TextStyle(
                                  fontSize: 10.sp, color: primaryColor),
                            ),
                          )
                        : const Text(""),
                  ],
                ),
              ),
              label: "Statistics",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: controller.tabIndex.toInt() == 2 ? 70.w : 60,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/statistics.svg",
                      height: 18.h,
                      width: 18.h,
                      colorFilter: ColorFilter.mode(
                        controller.tabIndex.toInt() == 2 ? primaryColor : hint,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    controller.tabIndex.toInt() == 2
                        ? Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "الرئيسية",
                              style: TextStyle(
                                  fontSize: 10.sp, color: primaryColor),
                            ),
                          )
                        : const Text(""),
                  ],
                ),
              ),
              label: "Statistics",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                width: controller.tabIndex.toInt() == 3 ? 70.w : 60,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/personal_icon.svg",
                      height: 18.h,
                      width: 18.h,
                      colorFilter: ColorFilter.mode(
                        controller.tabIndex.toInt() == 3 ? primaryColor : hint,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    controller.tabIndex.toInt() == 3
                        ? Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "الرئيسية",
                              style: TextStyle(
                                  fontSize: 10.sp, color: primaryColor),
                            ),
                          )
                        : const Text(""),
                  ],
                ),
              ),
              label: "Statistics",
            ),
          ],
        )),
  );
}
