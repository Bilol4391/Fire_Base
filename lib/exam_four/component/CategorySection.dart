import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Style/style.dart';
import '../controller/home_controller.dart';
import '../Pages/Main/productListPage.dart';


class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeController>();
    final event = context.read<HomeController>();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: state.listOfCategory.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 240,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProductPage()));
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: 178.w,
                  height: 184,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 50,
                          offset: Offset(0, 6),
                          color: Color(0xff5A6CEA).withOpacity(0.08))
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      state.listOfCategory[index].image == null
                          ? const SizedBox.shrink()
                          : Image.network(
                        state.listOfCategory[index].image ?? "",
                        height: 150,
                        width: 150,
                      ),
                      8.verticalSpace,
                      Text(state.listOfCategory[index].name ?? "",
                          style: ThemeText.textStyleRegular2(
                              size: 25, textColor: const Color(0xff6D7580))),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
