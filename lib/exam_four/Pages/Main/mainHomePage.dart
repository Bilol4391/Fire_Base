import 'package:firebase_lesson/exam_four/Pages/Main/HomePage.dart';
import 'package:firebase_lesson/exam_four/Pages/Main/productListPage.dart';
import 'package:firebase_lesson/exam_four/Pages/profilePage.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categoryPage.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

int _index = 0;

List listOfPage = [
  HomePageShop(),
  CategoryPage(),
  ProductPage(),
  ProfilePage(),
];

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBody: true,
      body: listOfPage[_index],

      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: FloatingNavbar(

        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        selectedItemColor: Color(0xffFF1843),
        selectedBackgroundColor: Color(0xffF43F5E).withOpacity(0.1),
        unselectedItemColor: Color(0xffFF1843),
        // backgroundColor: Color(0xffFfffff),
        backgroundColor: Colors.white,


        items: [
          FloatingNavbarItem(icon: Icons.home_filled,title: 'Home'),
          FloatingNavbarItem(icon: Icons.search_rounded, title: 'Search'),
          FloatingNavbarItem(icon: Icons.production_quantity_limits_rounded, title: 'Products'),
          FloatingNavbarItem(icon: Icons.person, title: 'Profile',),
        ],
      ),
    );
  }
}
