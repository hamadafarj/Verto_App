import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:second_task/app/core/values/colors.dart';
import 'controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  _buildFirstProfileWidget(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 160),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            _builderSilderWidget(homeController),
                            SizedBox(
                              height: 20.h,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildCategriesContainer(),
                                    _buildCategriesContainer(),
                                    _buildCategriesContainer(),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildCategriesContainer(),
                                    _buildCategriesContainer(),
                                    _buildCategriesContainer(),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
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

  _buildFirstProfileWidget() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          height: 150.h,
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                              maxRadius: 25,
                              backgroundImage:
                                  AssetImage("assets/images/profile_image.png")
                              //  NetworkImage(
                              //     "https://via.placeholder.com/150"),
                              ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "مرحبا , روز",
                            style: TextStyle(
                                fontFamily: "FFShamelFamily",
                                fontSize: 14.sp,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SvgPicture.asset("assets/icons/notification_icon.svg")
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "الرصيد",
                        style: TextStyle(
                            fontFamily: "FFShamelFamily",
                            fontSize: 16.sp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "40.3555",
                              style: TextStyle(
                                  fontFamily: "FFShamelFamily",
                                  fontSize: 16.sp,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: "YER",
                              style: TextStyle(
                                  fontFamily: "FFShamelFamily",
                                  fontSize: 14.sp,
                                  color: Colors.white),
                            ),
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
      ],
    );
  }

  _builderSilderWidget(HomeController homeController) {
    List imageList = [
      {
        "id": 1,
        "image_path": 'https://picsum.photos/200/300?random=1',
      },
      {"id": 2, "image_path": 'https://picsum.photos/200/300?random=2'},
      {
        "id": 3,
        "image_path": 'https://picsum.photos/200/300?random=3',
      },
    ];
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: CarouselSlider(
            items: imageList
                .map((item) => ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: NetworkImage(
                          item['image_path'],
                        ),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ))
                .toList(),
            carouselController: homeController.carouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              aspectRatio: 2,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                homeController.currentIndex.value = index;
                // setState(() {
                //   currentIndex = index;
                // });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => homeController.carouselController
                      .animateToPage(entry.key),
                  child: Container(
                    width: 7,
                    height: 7.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 3.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: homeController.currentIndex.value == entry.key
                            ? primaryColor
                            : Colors.white),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  _buildCategriesContainer() {
    return Column(
      children: [
        Container(
            height: 60.h,
            width: 65.w,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset("assets/icons/withdraw_icon.svg"),
            )),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "السحب النقدي",
          style: TextStyle(color: primaryColor, fontSize: 10.sp),
        )
      ],
    );
  }
}
