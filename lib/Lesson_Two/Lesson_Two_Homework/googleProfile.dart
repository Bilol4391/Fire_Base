import 'package:firebase_lesson/Lesson_Two/Lesson_Two_Homework/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleProfile extends StatefulWidget {
  const GoogleProfile(
      {Key? key,
      required this.rasm,
      required this.ism,
      required this.emailRaqam})
      : super(key: key);

  final String rasm;
  final String ism;
  final String emailRaqam;

  @override
  State<GoogleProfile> createState() => _GoogleProfileState();
}

class _GoogleProfileState extends State<GoogleProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F8BEE),
      appBar: AppBar(
        elevation: 0.01,
        backgroundColor: Color(0xff2F8BEE),
        title: Text(
          'Google Profile',
          style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white.withOpacity(0.7),
              )),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 55),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: const Color(0xffC4C4C4),
                  image: DecorationImage(
                      image: NetworkImage(widget.rasm), fit: BoxFit.cover)),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 11),
                child: Text(
                  widget.ism,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.8)),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(
                  widget.emailRaqam,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.white.withOpacity(0.8)),
                )),
            Row(
              children: [
                Container(
                  height: 105,
                  width: 110,
                  margin: const EdgeInsets.only(left: 30, top: 30),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                    color: Color(0xffF1F3F2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                          child: Icon(
                        Icons.notifications,
                        color: Color(0xff3B87E0),
                      )),
                      const SizedBox(
                        height: 8,
                      ),
                      Center(
                          child: Text(
                        "Notification",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: const Color(0xff777777)),
                      ))
                    ],
                  ),
                ),
                Container(
                  height: 105,
                  width: 110,
                  margin: const EdgeInsets.only(left: 25, top: 30),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                    color: Color(0xffF1F3F2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                          child: Icon(
                        Icons.card_giftcard,
                        color: Color(0xff26AD71),
                      )),
                      const SizedBox(
                        height: 8,
                      ),
                      Center(
                          child: Text(
                        "Voucher",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: const Color(0xff777777)),
                      ))
                    ],
                  ),
                ),
                Container(
                  height: 105,
                  width: 110,
                  margin: const EdgeInsets.only(left: 25, top: 30),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                    color: Color(0xffF1F3F2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                          child: Icon(
                        Icons.favorite,
                        color: Color(0xffEC534A),
                      )),
                      const SizedBox(
                        height: 8,
                      ),
                      Center(
                          child: Text(
                        "Wishlist",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: const Color(0xff777777)),
                      ))
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 20, top: 30),
              width: 420,
              height: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Color(0xffF1F3F2),
              ),
              child: Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.person,
                        color: Color(0xff26AD71),
                        size: 30,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: SizedBox(
                          width: 120,
                          child: Text(
                            "My profile",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: const Color(0xff777777)),
                          ))),
                  const Padding(
                      padding: EdgeInsets.only(left: 150),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Color(0xff777777),
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 20, top: 20),
              width: 420,
              height: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Color(0xffF1F3F2),
              ),
              child: Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.settings,
                        color: Color(0xff26AD71),
                        size: 30,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: SizedBox(
                          width: 120,
                          child: Text(
                            "Notification Setting",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: const Color(0xff777777)),
                          ))),
                  const Padding(
                      padding: EdgeInsets.only(left: 150),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Color(0xff777777),
                      )),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 20, top: 20),
              width: 420,
              height: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Color(0xffF1F3F2),
              ),
              child: Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(
                        Icons.logout_outlined,
                        color: Color(0xffEC534A),
                        size: 30,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: SizedBox(
                          width: 120,
                          child: Text(
                            "Log Out",
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: const Color(0xff777777)),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
