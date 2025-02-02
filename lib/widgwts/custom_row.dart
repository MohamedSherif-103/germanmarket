import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/app_color.dart';
import 'package:germaniatek_market/widgwts/custom_row_buton.dart';


class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.text,
    required this.onPress,
  });
  final String text;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.blackColor),
        ),
        CustomRowButton(
          onPress: onPress,
        ),
      ],
    );
  }
}
