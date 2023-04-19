import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportController extends GetxController with SingleGetTickerProviderMixin{
     late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

}





