
import 'package:flutter/material.dart';
import 'package:second_task/app/core/values/colors.dart';
import 'package:second_task/app/core/widgets/circle_chart_widget.dart';
import 'package:second_task/app/core/widgets/custom_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  ReportPageState createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
                child: TabBar(
                  controller: _tabController,
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
                ),
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Center(
                      child: Text(
                        'Place Bid',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    MyWidget()
                    // ChartWithDataWidget()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
              child: Stack(
                children: [
                  Positioned.fill(
                    child: PageView(
                      controller: contoller,
                      children: const [
                        ChartWithDataWidget(),
                        ChartWithDataWidget(),
                        ChartWithDataWidget()
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              contoller.previousPage(
                                  duration: const Duration(milliseconds: 2),
                                  curve: Curves.easeInBack);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              contoller.nextPage(
                                  duration: const Duration(milliseconds: 2),
                                  curve: Curves.easeInBack);
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartWithDataWidget extends StatelessWidget {
  const ChartWithDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 200.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200.w,
                height: 200.h,
                child: Stack(
                  children: [
                    const CircleChart(),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "اليوم",
                          ),
                          Text(
                            "  4555.33 ر.ي ",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("الخدمات"),
                  Text("4555.33  ر.ي"),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 13.h),
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          padding: const EdgeInsets.all(12),
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.yellow[700],
                          ),
                          // child: SvgPicture.asset(
                          //   "assets/images/payout.svg",
                          // ),
                        ),
                        const Text(
                          "سحب نقدي",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "+ 20.456 ر.ي",
                          style: TextStyle(color: Colors.green),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text(
                            "20 مارس",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

// class PieChartPainter extends CustomPainter {
//   final homeCtrl = Get.find<HomeController>();

//   @override
//   void paint(Canvas canvas, Size size) {
//     Offset center = Offset(size.width / 2, size.height / 2);
//     double radius = min(size.width / 3, size.height / 2);
//     double total = 0;
//     double startRadian = -pi / 2;
//     var paint = Paint()
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 25;
//     homeCtrl.category.forEach((f) => total += f['amount']);
//     for (var i = 0; i < homeCtrl.category.length; i++) {
//       final currentCategory = homeCtrl.category[i];
//       final sweepRadian = (currentCategory['amount'] / total) * 2 * pi;
//       paint.color = homeCtrl.pieColors[i];
//       canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
//           startRadian, sweepRadian, false, paint);
//       startRadian += sweepRadian;
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
