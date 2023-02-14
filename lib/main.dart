import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_lesson/exam_four/Pages/Main/HomePage.dart';
import 'package:firebase_lesson/exam_four/Pages/Main/mainHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'exam_four/controller/home_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainHomePage(),
          );
        },
      ),
    );
  }
}
