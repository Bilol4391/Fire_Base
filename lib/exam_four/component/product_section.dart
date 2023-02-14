import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Style/style.dart';
import '../controller/home_controller.dart';
import '../Pages/Main/productListPage.dart';


class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: context.watch<HomeController>().listOfProduct.length,
            itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12, top: 10),
                height: 30.h,
                width: 380.w,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: Colors.transparent),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    12.horizontalSpace,
                    context
                        .watch<HomeController>()
                        .listOfProduct[index]
                        .image ==
                        null
                        ? const SizedBox.shrink()
                        : Image.network(
                      context
                          .watch<HomeController>()
                          .listOfProduct[index]
                          .image ??
                          "",
                      height: 34.h,
                      width: 34.w,
                    ),
                    20.horizontalSpace,
                    Text(
                        context
                            .watch<HomeController>()
                            .listOfProduct[index]
                            .name ??
                            "",
                        style: ThemeText.textStyleRegular()),
                  ],
                ),
              ),
            ))),
      ),
    );
  }
}
