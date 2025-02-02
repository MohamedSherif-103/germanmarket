import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/app_color.dart';
import 'package:germaniatek_market/widgwts/cash_image.dart';
import 'package:germaniatek_market/widgwts/elevated_button.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "ProductDetailsView"),
      child: Card(
        color: AppColor.whiteColor,
        child: Column(
          children: [
            Stack(
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                  ),
                  child: CashImage(
                    url:
                        "https://img.freepik.com/free-photo/red-light-round-podium-black-background-mock-up_43614-950.jpg?t=st=1737194611~exp=1737198211~hmac=a7ca917155ca7fc303ca1fa36d0b57257a13caab618ad1faf455f60e0b8dd648&w=740",
                  ),
                ),
                Positioned(
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 70,
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                    ),
                    child: const Text(
                      "10% oFF",
                      style: TextStyle(color: AppColor.whiteColor),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Product Name",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          Text(
                            "130 LE",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          Text(
                            "100 LE",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 16,
                                // fontWeight: FontWeight.w700,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      CustomElevated(
                        text: 'Buy Now',
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
