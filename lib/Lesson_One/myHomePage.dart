import 'package:firebase_lesson/Lesson_One/addNew.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String? avatar;
  String? name;
  String? email_two;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isPasswordVisible = false;
  bool isEmailEmpty = false;
  bool isPasswordEmpty = false;


  List<Widget> listOfPage = [
     AddNew(avatar: '', name: '', email: '',),
    const MyHomePage(title: "Home Page"),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      width: 250,
                      height: 70,
                      margin: const EdgeInsets.only(left: 20, top: 50),
                      child: const Text(
                        "Welcome back to Grofast!",
                        style: TextStyle(
                          color: Color(0xff194B38),
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Email address",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff9C9C9C),
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                    Container(
                      width: 400,
                      height: 60,
                      margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        onChanged: (a) {
                          isEmailEmpty = false;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xff194B38).withOpacity(0.1),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(17))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(17)),
                              borderSide: BorderSide(
                                  color: const Color(0xff194B38).withOpacity(0.0),
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(17)),
                              borderSide: BorderSide(
                                  color: const Color(0xff194B38).withOpacity(0.0),
                                  width: 2.0),
                            ),
                            prefixIcon: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Icon(Icons.email_outlined),
                            )),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xff9C9C9C),
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                    Container(
                      width: 400,
                      height: 60,
                      margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: password,
                        onChanged: (s) {
                          isPasswordEmpty = false;
                          setState(() {});
                        },
                        obscureText: isPasswordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            suffixIcon: Container(
                              margin: const EdgeInsets.only(right: 7),
                              child: IconButton(
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: const Color(0xff5B5B5B),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xff194B38).withOpacity(0.1),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(17))),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(17)),
                              borderSide: BorderSide(
                                  color: const Color(0xff194B38).withOpacity(0.0),
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(17)),
                              borderSide: BorderSide(
                                  color: const Color(0xff194B38).withOpacity(0.0),
                                  width: 2.0),
                            ),
                            prefixIcon: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Icon(Icons.lock_outlined),
                            )),
                      ),
                    ),

                    GestureDetector(
                      onTap: () { },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 305),
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff9C9C9C)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 70,
                        width: 400,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        margin: const EdgeInsets.only(left: 25, right: 25, top: 50),
                        child: const Center(
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Center(
                        child: Text(
                          "or with",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xff4B4B4B)),
                        )),
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          margin: const EdgeInsets.only(left: 135, top: 25),
                          child: const Icon(
                            Icons.apple,
                            size: 80,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            try {
                              GoogleSignIn _googleSignIn = GoogleSignIn();
                              var data = await _googleSignIn.signIn();
                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddNew(avatar: avatar ?? '', name: name ?? '', email: email_two ?? '',)));
                              avatar = data?.photoUrl ?? '';
                              avatar = data?.displayName ?? '';
                              avatar = data?.email ?? '';

                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            margin: const EdgeInsets.only(left: 25, top: 40),
                            child: Image.asset("assets/google.png", fit: BoxFit.contain,),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 150),
                            child: Text(
                              "New user?",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  letterSpacing: .5),
                            )),
                        InkWell(
                          onTap: () {},
                          child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff4CBB5E),
                                    letterSpacing: .5),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}