
import 'package:firebase_lesson/exam_four/Model/productModel.dart';

class BannerModel {
  final String title;
  final ExamProductModel product;
  final String name;

  BannerModel(this.name, {required this.title, required this.product});

  factory BannerModel.fromJson(
      {required Map<String, dynamic> data, required Map? dataProduct}) {
    return BannerModel(
        title: data["title"], data["name"], product: ExamProductModel.fromJson(dataProduct,false));
  }
}