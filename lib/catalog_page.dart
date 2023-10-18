import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_furniture/firestore_products_list.dart';
import 'package:flutter_furniture/login_page.dart';
import 'package:flutter_furniture/models/products.dart';
import 'package:flutter_furniture/product_details.dart';
import 'package:flutter_furniture/product_item.dart';
import 'package:flutter_furniture/profile_page.dart';
import 'package:flutter_furniture/utils.dart';

class CatalogPage extends StatefulWidget {
  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ));
                      },
                      icon: CircleAvatar(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset("assets/user_profile.png")),
                      ));
                }
                if (snapshot.data == null) {
                  return IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      icon: const Icon(
                        Icons.account_circle_outlined,
                        size: 40,
                      ));
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              })
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, top: 30),
            child: Text(
              "Discover Products",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder(
              future: getFirebaseProductsList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final items = snapshot.data;
                  return Expanded(
                      child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
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
                  ));
                }
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              })
        ],
      ),
    );
  }
}
