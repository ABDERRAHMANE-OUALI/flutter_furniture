import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_furniture/models/products.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final void Function() onTap;

  const ProductItem({super.key, required this.product, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: CachedNetworkImage(
              imageUrl: product.image,
              height: 180,
            ),
          ),
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            product.price,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
