import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_lesson/Lesson_Three/Lesson_Three_Homework/addCar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_floating_button/gradient_floating_button.dart';
import 'package:readmore/readmore.dart';

import 'modelCar.dart';

class CarPage extends StatefulWidget {
  const CarPage({Key? key}) : super(key: key);


  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  List<CarModel> list = [];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202A3F),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Rented Cars",
          style:
              GoogleFonts.adamina(color: Color(0xffFD8165), letterSpacing: 1, fontSize: 23),
        ),
        elevation: 0.01,
        backgroundColor: Color(0xff202A3F),
      ),
      body: FutureBuilder(
        future: firestore.collection("cars").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            list.clear();
            snapshot.data?.docs.forEach((element) {
              list.add(CarModel.fromJson(element));
            });
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10, top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24)),
                                  image: DecorationImage(
                                      image: NetworkImage(list[index].image),
                                      fit: BoxFit.cover)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 5, left: 15),
                                    child: Text(
                                      list[index].name,
                                      style: GoogleFonts.adamina(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 22),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(top: 10, right: 15),
                                    child: Text(
                                      "\$ ${list[index].price}".toString(),
                                      style: GoogleFonts.adamina(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 18),
                                    )),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(
                                  color: Colors.white,
                                )),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 15, right: 6, top: 10),
                                      child: Icon(
                                        Icons.watch_later_outlined,
                                        color: Colors.black12.withOpacity(0.4),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Text(
                                            list[index].year.toString(),
                                            style: GoogleFonts.adamina(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                                fontSize: 18))),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 50, top: 6),
                                      child: Icon(Icons.speed,
                                          color:
                                          Colors.black12.withOpacity(0.4)),
                                    ),
                                    Container(
                                        margin:
                                        EdgeInsets.only(top: 6, left: 5),
                                        child: Text(list[index].speed.toString(),
                                          style: GoogleFonts.adamina(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 18),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 40, top: 6),
                                      child: Icon(Icons.power_outlined,
                                          color:
                                          Colors.black12.withOpacity(0.4)),
                                    ),
                                    Container(
                                        margin:
                                        EdgeInsets.only(top: 6, left: 5),
                                        child: Text(
                                          "HP: ${list[index].hp.toString()}",
                                          style: GoogleFonts.adamina(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              fontSize: 18),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(
                                  color: Colors.white,
                                )),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: ReadMoreText(
                                list[index].desc,
                                style: TextStyle(letterSpacing: .7, height: 1.5, fontSize: 15),
                                trimLines: 4,
                                colorClickableText: Colors.pink,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: ' Show less',
                                moreStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ));
                });
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: GradientFloatingButton().withLinearGradient(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddCar()));
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
