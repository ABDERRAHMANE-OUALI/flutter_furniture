import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_furniture/firestore_products_list.dart';
import 'package:flutter_furniture/models/products.dart';
import 'package:flutter_furniture/product_details.dart';
import 'package:flutter_furniture/product_item.dart';
import 'package:flutter_furniture/utils.dart';

class OnBoardingProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: getFirebaseProductsList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final items = snapshot.data;

            return PageView(
              children: items
                      ?.map<Widget>((e) => ProductItem(
                            product: Product(
                                image: e["image"],
                                name: e["name"],
                                price: e["price"]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        product: Product(
                                            image: e["image"],
                                            name: e["name"],
                                            price: e["price"])),
                                  ));
                            },
                          ))
                      .toList() ??
                  [],
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
