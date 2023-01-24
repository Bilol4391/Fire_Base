import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class AddNew extends StatefulWidget {
  AddNew({Key? key, required this.avatar, required this.name, required this.email}) : super(key: key);
  final String avatar;
  final String name;
  final String email;

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final TextEditingController controller = TextEditingController();

  @override
  int _selectedIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 55),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color(0xffC4C4C4),
              ),
            ),
            Column(
              children: [
                widget.avatar == null ? SizedBox.shrink() : Image.asset(widget.avatar ?? ""),
                widget.name == null ? SizedBox.shrink() : Text(widget.name ?? ""),
                widget.email == null ? SizedBox.shrink() : Text(widget.email ?? ""),
              ],
            ),
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
        ]),
      ));
  }
}
