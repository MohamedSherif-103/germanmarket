import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/custom_appbar.dart';
import 'package:germaniatek_market/widgwts/product_list.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});
  static String id = "MyOrderView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'My Orders',
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ProductList(
          shrinkWrap: false,
          physics:
              BouncingScrollPhysics(), // دى افضل من اللى تحت نفسها بس افضل منها
          //  physics: AlwaysScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
