import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Style/style.dart';
import '../controller/home_controller.dart';


class Chegirma extends StatelessWidget {
  const Chegirma({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: context
              .watch<HomeController>()
              .listOfBanners
              .length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft, end: Alignment.bottomRight,
                      colors: [Color(0xffFDB229), Color(0xffF48C09)]
                  ),
                  borderRadius:
                  BorderRadius.circular(30)),
              child: Row(
                children: [
                  context.watch<HomeController>().listOfBanners[index].product.image != null
                      ? Container(
                    height: 150,
                    width: 115,
                    margin: EdgeInsets.only(left: 0, top: 0, bottom: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                        image: DecorationImage(image: NetworkImage(
                          context.watch<HomeController>().listOfBanners[index].product.image ?? "",
                        ), fit: BoxFit.cover)
                    ),
                  )
                      : const SizedBox.shrink(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 220,
                        child: Container(
                          child: Center(
                            child: Text(context
                                .watch<HomeController>()
                                .listOfBanners[index]
                                .name, overflow: TextOverflow.ellipsis, style: ThemeText.chegirma,),
                          ),
                        ),
                      ),
                      SizedBox(height: 4,),
                      Text(context
                          .watch<HomeController>()
                          .listOfBanners[index]
                          .title ??
                          "", style: ThemeText.chegirma,),
                      Container(
                        width: 120.w,
                        height: 37.h,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(100.r)),
                          color: Color(0xffFFB800),
                        ),
                        margin: EdgeInsets.only(left: 0.r, top: 15.r),
                        child: Center(
                            child: Text(
                              "Buy now",
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffffffff)),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
