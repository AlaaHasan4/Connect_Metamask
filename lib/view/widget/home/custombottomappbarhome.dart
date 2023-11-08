import 'package:bidding/controller/homescreen_controller.dart';
import 'package:bidding/view/widget/home/custombottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              controller.listPage.length,
              ((index) {
                return CustomBottomAppBar(
                    textBottom: controller.bottomappbar[index]["title"],
                    icondata: controller.bottomappbar[index]["icon"],
                    onPressed: () {
                      controller.changePage(index);
                    },
                    active: controller.currentpage == index ? true : false);
              }),
            )
          ],
        ),
      ),
    );
  }
}
