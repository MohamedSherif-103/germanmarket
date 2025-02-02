import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/product_list.dart';

class Favoriteview extends StatelessWidget {
  const Favoriteview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          Text(
            textAlign: TextAlign.center,
            "Your Favorite Products",
            style: TextStyle(
                fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          ProductList(),
        ],
      ),
    );
  }
}
