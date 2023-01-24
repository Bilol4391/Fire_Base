import 'package:firebase_lesson/Lesson_One/addNew.dart';
import 'package:firebase_lesson/Lesson_One/myHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override

  int _selectedIndex = 0;

  List <Widget> listOfPage  = [
    const MyHomePage(title: "Home Page",),
    AddNew(avatar: '', name: '', email: '',),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfPage[_selectedIndex],
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeHeight: 25,
        barHeight: 80,
        // specify what will happen when a tab is clicked
        onTabChange: (clickedIndex) {
          setState(() {
            _selectedIndex = clickedIndex;
          });
        },
        // ansert as many tabs as you like
        tabs: [
          MoltenTab(
            icon: Icon(Icons.home),
            title: Text('home'),
            // selectedColor: Colors.yellow,
          ),
          MoltenTab(
            icon: Icon(Icons.person),
            // selectedColor: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
