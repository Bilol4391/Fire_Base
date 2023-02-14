import 'package:firebase_lesson/exam_four/component/customProduct_search.dart';
import 'package:firebase_lesson/exam_four/component/product_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            CustomProductSearchSection.CustomBottomButton(icon: "", height: 0),
            ProductSection(),
          ],
        ),
      )
    );
  }
}
