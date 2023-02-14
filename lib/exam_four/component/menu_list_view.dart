import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Style/style.dart';
import '../controller/home_controller.dart';
import '../Pages/Main/productListPage.dart';


class MenuListView extends StatelessWidget {
  const MenuListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 28.r),
                  child: Text(
                    "Popular Menu",
                    style: GoogleFonts.raleway(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff194B38)),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProductPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 22),
                    child: Text(
                      "See All",
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF43F5E)),
                    ),
                  ),
                ),
              ],
            ),
            15.verticalSpace,
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: context.watch<HomeController>().listOfProduct.length >= 4
                    ? 4
                    : context.watch<HomeController>().listOfProduct.length,
                itemBuilder: ((context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    height: 110.h,
                    width: 380.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 50,
                              offset: const Offset(0, 6),
                              color: const Color(0xff5A6CEA).withOpacity(0.08))
                        ],
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        color: Colors.white),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          height: 64.h,
                          width: 64.w,
                        ),
                        20.horizontalSpace,
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    context
                                        .watch<HomeController>()
                                        .listOfProduct[index]
                                        .name ??
                                        "",
                                    style: ThemeText.textStyleRegular()),
                                4.verticalSpace,
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                      context
                                          .watch<HomeController>()
                                          .listOfProduct[index]
                                          .desc ??
                                          "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: ThemeText.textStyleRegular2(
                                          size: 14,
                                          textColor: const Color(0xff858C94))),
                                ),
                                Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    '\$${context.watch<HomeController>().listOfProduct[index].price.toString()}',
                                    style: ThemeText.textStyleRegular(
                                        size: 20, textColor: ThemeText.primaryColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))),
          ],
        ),
      ),
    );
  }
}
