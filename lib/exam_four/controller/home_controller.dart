import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_lesson/exam_four/Model/bannerModel.dart';
import 'package:firebase_lesson/exam_four/Model/productModel.dart';
import 'package:flutter/cupertino.dart';

import '../Model/examCategoryModel.dart';



class HomeController extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<BannerModel> listOfBanners = [];
  List<ExamProductModel> listOfProduct = [];
  List<ExamCategoryModel> listOfCategory = [];
  List listOfCategoryDocId = [];
  List listOfProductDocId = [];
  bool _isLoading = true;
  bool _isCategoryLoading = true;
  bool _isProductLoading = true;

  searchCategory(String name) async {
    var res = await firestore.collection("category").orderBy("name").startAt(
        [name]).endAt(["${name}\uf8ff"]).get();
    listOfCategory.clear();
    listOfCategoryDocId.clear();
    for (var element in res.docs) {
      listOfCategory.add(ExamCategoryModel.fromJson(element.data()));
      listOfCategoryDocId.add(element.id);
    }
    notifyListeners();
  }

  searchProduct(String name) async {
    print(name);
    var res = await firestore.collection("products").orderBy("name").startAt(
        [name]).endAt(["${name}\uf8ff"]).get();
    listOfProduct.clear();
    listOfProductDocId.clear();
    for (var element in res.docs) {
      listOfProduct.add(ExamProductModel.fromJson(element.data(), false));
      listOfProductDocId.add(element.id);
    }
    print(name);
    notifyListeners();
  }

  bool get isTotalLoading =>
      _isLoading || _isCategoryLoading || _isProductLoading;

  getBanners() async {
    _isLoading = true;
    notifyListeners();
    var res = await firestore.collection("banner").get();
    listOfBanners.clear();
    for (var element in res.docs) {
      String docId = element.data()["productId"];
      var res = await firestore
          .collection("products")
          .doc(docId.replaceAll(" ", ""))
          .get();
      listOfBanners.add(
          BannerModel.fromJson(data: element.data(), dataProduct: res.data()));
    }
    _isLoading = false;
    notifyListeners();
  }

  getCategory({bool isLimit = true}) async {
    _isCategoryLoading = true;
    notifyListeners();
    dynamic res;
    if (isLimit) {
      res = await firestore.collection("category").limit(5).get();
    } else {
      res = await firestore.collection("category").get();
    }
    listOfCategory.clear();
    listOfCategoryDocId.clear();
    for (var element in res.docs) {
      listOfCategory.add(ExamCategoryModel.fromJson(element.data()));
      listOfCategoryDocId.add(element.id);
    }
    _isCategoryLoading = false;
    notifyListeners();
  }

  getProduct({bool isLimit = false}) async {
    _isProductLoading = true;
    notifyListeners();
    var res;
    if (isLimit) {
      res = await firestore.collection("products").limit(5).get();

    } else {
      res = await firestore.collection("products").get();
    }
    listOfProduct.clear();
    listOfProductDocId.clear();
    for (var element in res.docs) {
      listOfProductDocId.add(element.id);
      print(element.data());
      listOfProduct.add(ExamProductModel.fromJson(element.data(),false));
    }
    _isProductLoading = false;
    notifyListeners();
  }


}