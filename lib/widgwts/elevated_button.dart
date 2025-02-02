import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/app_color.dart';


class CustomElevated extends StatelessWidget {
  const CustomElevated({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: AppColor.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      onPressed: onTap,
      child: Text(text),
    );
  }
}
