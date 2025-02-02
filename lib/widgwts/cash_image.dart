import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:germaniatek_market/widgwts/app_color.dart';


class CashImage extends StatelessWidget {
  const CashImage({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: double.infinity,
      height: 250,
      imageUrl: url,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: AppColor.primaryColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }
}
