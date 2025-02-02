import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    this.shrinkWrap,
    this.physics,
  });
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: shrinkWrap ?? true,
      physics: physics ?? const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const ProductCard();
      },
      itemCount: 12,
    );
  }
}
