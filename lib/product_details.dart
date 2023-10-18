import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_furniture/models/products.dart';
import 'package:rive/rive.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(flex: 3, child: CachedNetworkImage(imageUrl: product.image)),
          const Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              bottom: 20,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 40,
                ),
                Text(
                  "4.8",
                  style: TextStyle(color: Colors.amber, fontSize: 40),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Chip(
                    label: Text(
                      "145 Reviews",
                      style: TextStyle(fontSize: 20),
                    ),
                    backgroundColor: Color.fromARGB(255, 208, 208, 208),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
            ),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(boxShadow: []),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        product.price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Center(
                                  child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: RiveAnimation.network(
                                          "https://public.rive.app/community/runtime-files/47-61-checkanimation.riv"))),
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.black),
                              fixedSize:
                                  MaterialStatePropertyAll(Size(240, 70)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))
                    ]),
              ))
        ],
      ),
    );
  }
}
