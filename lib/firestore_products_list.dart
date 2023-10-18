import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map>> getFirebaseProductsList() async {
  final docs = await FirebaseFirestore.instance.collection("Chairs").get();
  final products = docs.docs.map((e) => e.data()).toList();
  return products;
}
