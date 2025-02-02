import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/app_color.dart';

class CustomRowButton extends StatelessWidget {
  const CustomRowButton({
    super.key,
    required this.onPress,
  });
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPress,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
