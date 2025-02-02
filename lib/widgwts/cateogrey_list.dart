import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/app_color.dart';

class CateogreyList extends StatelessWidget {
  const CateogreyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundColor: AppColor.primaryColor,
                  foregroundColor: Colors.white,
                  child: Icon(categoryList[index].icon),
                ),
                Text(categoryList[index].text,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))
              ],
            ),
          );
        },
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

// list
List<Categories> categoryList = [
  Categories(icon: Icons.sports, text: 'Sport'),
  Categories(icon: Icons.tv, text: 'Electronics'),
  Categories(icon: Icons.collections, text: 'Collections'),
  Categories(icon: Icons.book, text: 'Books'),
  Categories(icon: Icons.games, text: 'Games'),
  Categories(icon: Icons.restaurant, text: 'Food'),
  Categories(icon: Icons.local_mall, text: 'Shopping'),
  Categories(icon: Icons.local_hospital, text: 'Health & Beauty'),
  Categories(icon: Icons.local_parking, text: 'Parking'),
  Categories(icon: Icons.local_car_wash, text: 'Car Wash'),
  Categories(icon: Icons.local_dining, text: 'Dining'),
  Categories(icon: Icons.local_gas_station, text: 'Gas Station'),
  Categories(icon: Icons.local_grocery_store, text: 'Grocery Store'),
  Categories(icon: Icons.local_pizza, text: 'Pizza'),
  Categories(icon: Icons.local_restaurant, text: 'Restaurant'),
  Categories(icon: Icons.local_shipping, text: 'Shipping'),
];

// model
class Categories {
  final IconData icon;
  final String text;

  Categories({required this.icon, required this.text});
}
