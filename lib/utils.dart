import 'dart:convert';

import 'package:flutter/services.dart';

Future<Map<String, dynamic>> getProductsList() async {
  final products = await rootBundle.loadString("assets/db.json");
  Map<String, dynamic> data = jsonDecode(products);
  return data;
}
