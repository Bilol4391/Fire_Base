// import 'package:flutter/cupertino.dart';
//
// class Page extends StatelessWidget {
//   const Page({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: list.length,
//         itemBuilder: (context, index) {
//           return Container(
//               margin: EdgeInsets.only(top: 20, left: 20, right: 20),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.6),
//                 borderRadius: BorderRadius.all(Radius.circular(24)),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.only(bottom: 10, top: 0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 140,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(24),
//                               topRight: Radius.circular(24)),
//                           image: DecorationImage(
//                               image: NetworkImage(list[index].carImage),
//                               fit: BoxFit.cover)),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(top: 5, left: 15),
//                             child: Text(
//                               list[index].carName,
//                               style: GoogleFonts.adamina(
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white,
//                                   fontSize: 22),
//                             )),
//                         Container(
//                             margin: EdgeInsets.only(top: 10, right: 15),
//                             child: Text(
//                               "\$ ${list[index].carPrice.toString()}",
//                               style: GoogleFonts.adamina(
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white,
//                                   fontSize: 18),
//                             )),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                         margin: EdgeInsets.symmetric(horizontal: 20),
//                         child: Divider(
//                           color: Colors.white,
//                         )),
//                     Row(
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(
//                                   left: 15, right: 6, top: 10),
//                               child: Icon(
//                                 Icons.watch_later_outlined,
//                                 color: Colors.black12.withOpacity(0.4),
//                               ),
//                             ),
//                             Container(
//                                 margin: EdgeInsets.only(top: 10),
//                                 child: Text(
//                                     list[index].carYear.toString(),
//                                     style: GoogleFonts.adamina(
//                                         fontWeight: FontWeight.w700,
//                                         color: Colors.white
//                                             .withOpacity(0.7),
//                                         fontSize: 18))),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(left: 50, top: 6),
//                               child: Icon(Icons.speed,
//                                   color:
//                                   Colors.black12.withOpacity(0.4)),
//                             ),
//                             Container(
//                                 margin:
//                                 EdgeInsets.only(top: 6, left: 5),
//                                 child: Text(
//                                   "${list[index].carSpeed.toString()}",
//                                   style: GoogleFonts.adamina(
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.white,
//                                       fontSize: 18),
//                                 )),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(left: 40, top: 6),
//                               child: Icon(Icons.power_outlined,
//                                   color:
//                                   Colors.black12.withOpacity(0.4)),
//                             ),
//                             Container(
//                                 margin:
//                                 EdgeInsets.only(top: 6, left: 5),
//                                 child: Text(
//                                   "HP: ${list[index].carHp.toString()}",
//                                   style: GoogleFonts.adamina(
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.white,
//                                       fontSize: 18),
//                                 )),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                         margin: EdgeInsets.symmetric(horizontal: 20),
//                         child: Divider(
//                           color: Colors.white,
//                         )),
//                     Container(
//                       margin: EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       child: ReadMoreText(
//                         list[index].carDesc,
//                         style: TextStyle(letterSpacing: .7, height: 1.5, fontSize: 15),
//                         trimLines: 4,
//                         colorClickableText: Colors.pink,
//                         trimMode: TrimMode.Line,
//                         trimCollapsedText: 'Show more',
//                         trimExpandedText: ' Show less',
//                         moreStyle: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//               ));
//         });
//   }
// }
