import 'package:bidding/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
  ];

  List bottomappbar = [
    {"title": "Home", "icon": Icons.home},
  ];

  @override
  changePage(int index) {
    currentpage = index;
    update();
  }
}
