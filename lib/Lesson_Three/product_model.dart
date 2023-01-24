import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String name;
  final String desc;
  final num price;
  final String location;

  ProductModel({required this.name, required this.desc, required this.price, required this.location, });

  factory ProductModel.fromJson(QueryDocumentSnapshot data) {
    return ProductModel(
        name: data["name"], desc: data["desc"], price: data["price"], location: data['location']);
  }

  toJson() {
    return {"name": name, "desc": desc, "price": price, "location" : location};
  }
}