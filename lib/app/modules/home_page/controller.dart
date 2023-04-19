import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_task/app/modules/home_page/view.dart';
import 'package:second_task/app/modules/redorts_page/view.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  final CarouselController carouselController = CarouselController();
  final tabIndex = 0.obs;

  List widgets = [
    {
      "id": 0,
      "Widget": const HomePage(),
      "icon": Icons.home,
      "title": "الرئيسية"
    },
    {
      "id": 1,
      "Widget":const Text("data"),
      "icon": Icons.heart_broken_outlined,
      "title": "adf"
    },
    {
      "id": 2,
      "Widget": const ReportPage(),
      "icon": Icons.home,
      "title": "الرئيسية"
    },
    {
      "id": 3,
      "Widget": const Text("data"),
      "icon": Icons.person_outline,
      "title": "aass"
    },
  ];
 List category = [
    {"name": "Eating Out", "amount": 100.0},
    {"name": "Bills", "amount": 100.0},
    {"name": "Online Shopping", "amount": 20.0},
    {"name": "Subscriptions", "amount": 100.0},
    {"name": "Fees", "amount": 5.0},
  ];
  List pieColors = [
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.deepOrange,
    Colors.brown,
  ];

  void changeTab(int index) {
    tabIndex.value = index;
  }
}
