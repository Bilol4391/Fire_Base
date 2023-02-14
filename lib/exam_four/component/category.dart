import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Style/style.dart';
import '../controller/home_controller.dart';


class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: SizedBox(
            height: 190,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: context
                    .watch<HomeController>()
                    .listOfCategory
                    .length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 20, right: 0),
                    width: (MediaQuery.of(context).size.width - 0) / 2.2,
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        border: Border.all(color: Colors.grey),
                        borderRadius:
                        BorderRadius.circular(40)),
                    child: Column(
                      children: [
                        context.watch<HomeController>().listOfCategory[index].image != null
                            ? Container(
                          height: 84,
                          margin: EdgeInsets.only(top:15, bottom: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(image: NetworkImage(context.watch<HomeController>().listOfCategory[index].image ?? ""), fit: BoxFit.contain)
                          ),
                        )
                            : const SizedBox.shrink(),
                        Text(context
                            .watch<HomeController>()
                            .listOfCategory[index]
                            .name ??
                            "", style: ThemeText.horizontalProduct,),
                      ],
                    ),
                  );
                }),
          ),
        ),
        10.r.verticalSpace,
        Container(
          margin: EdgeInsets.only(left: 28.r),
          child: Text(
            "Featured",
            style: GoogleFonts.raleway(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff194B38)),
          ),
        ),
        20.r.verticalSpace,
      ],
    );
  }
}
