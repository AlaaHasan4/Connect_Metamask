import 'package:bidding/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textBottom;
  final IconData icondata;
  final bool? active;
  const CustomBottomAppBar(
      {super.key,
      required this.textBottom,
      required this.icondata,
      this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            color: active == true ? AppColor.primaryColor : AppColor.grey2,
          ),
          Text(
            textBottom,
            style: TextStyle(
                color: active == true ? AppColor.primaryColor : AppColor.grey2),
          ),
        ],
      ),
    );
  }
}
