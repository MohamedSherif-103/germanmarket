import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/app_color.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMsg(
    BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: AppColor.primaryColor,
    ),
  );
}
