import 'package:flutter/material.dart';
import 'package:flutter_furniture/catalog_page.dart';
import 'package:flutter_furniture/onboarding_action.dart';
import 'package:flutter_furniture/onboarding_products_list.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/kam-idris-_HqHX3LBN18-unsplash.jpg",
          height: MediaQuery.sizeOf(context).height / 1.5,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Colors.white),
            height: MediaQuery.sizeOf(context).height / 2.2,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Popular Products",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CatalogPage(),
                                ));
                          },
                          child: const Text(
                            "View all",
                            style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      )
                    ],
                  ),
                  OnBoardingProductsList()
                ],
              ),
            ),
          ),
        ),
        Positioned(top: 172, left: 50, child: OnBoardingAction()),
      ],
    );
  }
}
