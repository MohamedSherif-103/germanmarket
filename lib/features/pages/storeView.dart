import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/cust_search_field.dart';
import 'package:germaniatek_market/widgwts/product_list.dart';

class Storeview extends StatelessWidget {
  const Storeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          Text(
            textAlign: TextAlign.center,
            "Welcome To Our Market",
            style: TextStyle(
                fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15,
          ),
          CustomSearchField(),
          SizedBox(
            height: 15,
          ),
          ProductList(),
        ],
      ),
    );
  }
}
