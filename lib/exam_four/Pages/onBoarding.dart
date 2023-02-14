import 'package:firebase_lesson/exam_four/Pages/Main/HomePage.dart';
import 'package:firebase_lesson/exam_four/Pages/Main/mainHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () async {
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MainHomePage()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          300.h.verticalSpace,
          Center(child: Image.asset("assets/Logo_shop.png")),
          Spacer(),
          Image.asset("assets/loading.gif", height: 80.h, color: Color(0xffF5560B),)
        ],
      ),
    );
  }
}
