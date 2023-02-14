import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controller/home_controller.dart';

class CustomSearchSection extends StatelessWidget {
  final int height;
  final String icon;

  // ignore: non_constant_identifier_names
  const CustomSearchSection.CustomBottomButton(
      {Key? key,
        required this.icon, required this.height,})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeController>();
    final event = context.read<HomeController>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 250.w,
          height: 55.h,
          margin: EdgeInsets.only(top: 5.r, left: 20.r, right: 20.r),
          child: TextFormField(
            onChanged: (s) {
              event.searchCategory(s);
            },
            style: GoogleFonts.raleway(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                letterSpacing: 0.7.r,
                color: Color(0xff194B38)),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20.r),
              filled: true,
              suffixIcon:
              Container(margin: EdgeInsets.only(right: 10.r),child: Image.asset("assets/voice.png")),
              prefixIcon:
              Container(margin: EdgeInsets.only(right: 0.r),child: Image.asset("assets/search.png",)),
              labelText: "Search",
              labelStyle: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Color(0xff09101D)),
              fillColor: Color(0xffffffff),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
                borderSide: BorderSide(
                    color: Color(0xffF4F6F9)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
                borderSide: BorderSide(
                    color: Color(0xffF4F6F9)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.r)),
                borderSide: BorderSide(
                    color: Color(0xffF4F6F9)),
              ),
            ),
          ),
        ),
        Image.asset("assets/Cart.png")
      ],
    );
  }
}
