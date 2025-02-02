import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:germaniatek_market/widgwts/cash_image.dart';
import 'package:germaniatek_market/widgwts/comment_list.dart';
import 'package:germaniatek_market/widgwts/custom_appbar.dart';
import 'package:germaniatek_market/widgwts/custom_textformfield.dart';


class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
  static String id = "ProductDetailsView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Product Name"),
      body: ListView(
        children: [
          const CashImage(
              url:
                  "https://media.istockphoto.com/id/1340887706/photo/outside-of-logistics-retail-warehouse-with-inventory-manager-using-tablet-computer-talking-to.jpg?s=612x612&w=0&k=20&c=BSKvIWQwcKonh_A5D65y1YZKG77k7Qgvn1VvZViVIQE="),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 18),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product Name"),
                    Text("120  LE"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("3 "),
                        Icon(
                          Icons.star,
                          color: Colors.amberAccent,
                        )
                      ],
                    ),
                    Icon(
                      (Icons.favorite),
                      color: Colors.grey,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Product Description"),
                const SizedBox(
                  height: 15,
                ),
                RatingBar.builder(
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                    suffix: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.send)),
                    hintText: "Type Your Feedback",
                    keyboardType: TextInputType.text),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  children: [
                    Text(
                      "Comments",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const CommentsList()

                // const UserComment(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
