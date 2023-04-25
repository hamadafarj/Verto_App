import 'package:flutter/material.dart';
import 'package:second_task/app/modules/redorts_page/view.dart';


class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final contoller = PageController(initialPage: 1);

  @override
  void dispose() {
    contoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: PageView(
                  controller: contoller,
                  children: const [
                    ChartWithDataWidget(),
                    ChartWithDataWidget(),
                    ChartWithDataWidget()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_task/app/core/values/colors.dart';
import 'package:second_task/app/core/widgets/custom_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller.dart';

class StackOver extends StatelessWidget {
  final ReportController controller = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.only(left: 22.w),
              child: notification(),
            )
          ],
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text(
            "تقارير وعمليات",
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Container(
                height: 40.h,
                width: 280.w,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: Obx(() => TabBar(
                      controller: Get.find<ReportController>().tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: secondary,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: hint,
                      tabs: const [
                        Tab(
                          text: 'العمليات',
                        ),
                        Tab(
                          text: 'تقارير ',
                        ),
                      ],
                    )),
              ),
              // tab bar view here
              Expanded(
                child: Obx(() => TabBarView(
                      controller: controller.tabController,
                      children:const [
                        // first tab bar view widget
                        Center(
                          child: Text(
                            'Place Bid',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        // second tab bar view widget
                        Center(
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 240,
          height: 70,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
          ),
          child: ElevatedButton(
              child: const Text(
                "Button Sheet",
              ),
              onPressed: () {
                bottomSheetWidget(
                    context,
                    "assets/icons/bottom_sheet_icon.svg",
                    Center(
                      child: SizedBox(
                        height: 280.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            _buildRowWidget(context, "المستلم", "xxxxxxxx"),
                            _buildRowWidget(
                                context, "المبلغ", "الف اربعين ر.ي"),
                            _buildRowWidget(
                                context, "الشبكة", "ثمانمئة وستون ر.ي"),
                            _buildRowWidget(
                                context, "الرسوم الخدمة", "شركة نعمان لصرافة"),
                            _buildRowWidget(
                                context, "الأجمالي", "الف اربعين ر.ي"),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  buildCustomButton(
                                      context, () {}, 150.w, "تاكيد"),
                                      SizedBox(width: 50.w,),
                                    Text("الغاء",style: Theme.of(context).textTheme.labelSmall)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
              }),
        ),
      ),
    );
  }

  _buildRowWidget(BuildContext context, String str, subStr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(str, style: Theme.of(context).textTheme.labelMedium),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subStr, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
*/
