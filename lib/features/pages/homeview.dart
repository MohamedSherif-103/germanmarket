import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/cateogrey_list.dart';
import 'package:germaniatek_market/widgwts/cust_search_field.dart';
import 'package:germaniatek_market/widgwts/product_list.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          const CustomSearchField(),
          const SizedBox(
            height: 40,
          ),
          Image.asset("assets/images/buy.jpg"),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Popular Category",
            style: TextStyle(
                fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          const CateogreyList(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Recently Products",
            style: TextStyle(
                fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          const ProductList(),
        ],
      ),
    );
  }
}
