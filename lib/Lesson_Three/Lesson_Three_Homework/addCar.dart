import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_lesson/Lesson_Three/Lesson_Three_Homework/carPage.dart';
import 'package:firebase_lesson/Lesson_Three/Lesson_Three_Homework/modelCar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_floating_button/gradient_floating_button.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController carNameController = TextEditingController();
  final TextEditingController carImageController = TextEditingController();
  final TextEditingController carDescController = TextEditingController();
  final TextEditingController carSpeedController = TextEditingController();
  final TextEditingController carYearController = TextEditingController();
  final TextEditingController carPriceController = TextEditingController();
  final TextEditingController carHpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202A3F),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(
          "Rented Cars",
          style: GoogleFonts.adamina(
              color: Color(0xffFD8165), letterSpacing: 1, fontSize: 23),
        ),
        elevation: 0.01,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => CarPage()));
            },
            child: Padding(
                padding: EdgeInsets.only(top: 3, left: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffFD8165),
                  size: 23,
                ))),
        backgroundColor: Color(0xff202A3F),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              style: GoogleFonts.adamina(
                  color: Color(0xffFD8165), letterSpacing: 1, fontSize: 18),
              controller: carNameController,
              decoration: InputDecoration(
                  labelText: "Car Name",
                  labelStyle: GoogleFonts.adamina(
                      color: Colors.white, fontSize: 20, letterSpacing: 0.7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Colors.purpleAccent, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffFD8165), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              style: GoogleFonts.adamina(
                  color: Color(0xffFD8165), letterSpacing: 1, fontSize: 18),
              controller: carPriceController,
              decoration: InputDecoration(
                  labelText: "Car Price",
                  labelStyle: GoogleFonts.adamina(
                      color: Colors.white, fontSize: 20, letterSpacing: 0.7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Colors.purpleAccent, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffFD8165), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              style: GoogleFonts.adamina(
                  color: Color(0xffFD8165), letterSpacing: 1, fontSize: 18),
              controller: carHpController,
              decoration: InputDecoration(
                  labelText: "Car HP",
                  labelStyle: GoogleFonts.adamina(
                      color: Colors.white, fontSize: 20, letterSpacing: 0.7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Colors.purpleAccent, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffFD8165), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              style: GoogleFonts.adamina(
                  color: Color(0xffFD8165), letterSpacing: 1, fontSize: 18),
              controller: carDescController,
              decoration: InputDecoration(
                  labelText: "Car Desc",
                  labelStyle: GoogleFonts.adamina(
                      color: Colors.white, fontSize: 20, letterSpacing: 0.7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Colors.purpleAccent, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffFD8165), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              style: GoogleFonts.adamina(
                  color: Color(0xffFD8165), letterSpacing: 1, fontSize: 18),
              controller: carImageController,
              decoration: InputDecoration(
                  labelText: "Car Image",
                  labelStyle: GoogleFonts.adamina(
                      color: Colors.white, fontSize: 20, letterSpacing: 0.7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Colors.purpleAccent, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffFD8165), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              style: GoogleFonts.adamina(
                  color: Color(0xffFD8165), letterSpacing: 1, fontSize: 18),
              controller: carSpeedController,
              decoration: InputDecoration(
                  labelText: "Car Speed",
                  labelStyle: GoogleFonts.adamina(
                      color: Colors.white, fontSize: 20, letterSpacing: 0.7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Colors.purpleAccent, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffFD8165), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              style: GoogleFonts.adamina(
                  color: Color(0xffFD8165), letterSpacing: 1, fontSize: 18),
              controller: carYearController,
              decoration: InputDecoration(
                  labelText: "Car Year",
                  labelStyle: GoogleFonts.adamina(
                      color: Colors.white, fontSize: 20, letterSpacing: 0.7),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(color: Colors.purpleAccent, width: 1)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Color(0xffFD8165), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: GradientFloatingButton().withLinearGradient(
        onTap: () {
          firestore
              .collection("cars")
              .add(CarModel(
              name: carNameController.text,
              desc: carDescController.text,
              price: int.tryParse(carPriceController.text) ?? 0,
              year: int.tryParse(carYearController.text) ?? 0,
              hp: int.tryParse(carHpController.text) ?? 0,
              image: carImageController.text,
              speed: int.tryParse(carSpeedController.text) ?? 0)
              .toJson())
              .then((value) {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (_) => CarPage()), (route) => false);
          });
        },
        iconWidget: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        alignmentEnd: Alignment.topRight,
        alignmentBegin: Alignment.bottomLeft,
        colors: [Color(0xffFD8165), Color(0xffFD8165)],
      ),
    );
  }
}
