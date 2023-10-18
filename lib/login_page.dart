import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_furniture/catalog_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SignInScreen(
        actions: [
          AuthStateChangeAction<SigningIn>((context, state) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CatalogPage(),
                ));
          })
        ],
      ),
    );
  }
}
