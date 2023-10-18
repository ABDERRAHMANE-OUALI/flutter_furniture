import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_furniture/catalog_page.dart';

class OnBoardingAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Renovate \n Your Interior",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
        ).animate().slideY(duration: 1.seconds, begin: 0.5),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatalogPage(),
                ));
          },
          child: const Text(
            "Go to Catalog",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          style: ButtonStyle(
              fixedSize: const MaterialStatePropertyAll(Size(220, 60)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.only(right: 30, left: 30, top: 14, bottom: 14)),
              backgroundColor: MaterialStateProperty.all(Colors.white)),
        ).animate().slideY(duration: 1.seconds, begin: 0.5)
      ],
    );
  }
}
