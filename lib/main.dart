import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_lesson/Lesson_One/myHomePage.dart';
import 'package:firebase_lesson/Lesson_Three/Lesson_Three_Homework/addCar.dart';
import 'package:firebase_lesson/Lesson_Three/Lesson_Three_Homework/carPage.dart';
import 'package:firebase_lesson/Lesson_Three/add_product.dart';
import 'package:firebase_lesson/Lesson_Three/fireStoreDatabase.dart';
import 'package:firebase_lesson/Lesson_Two/Lesson_Two_Homework/googleProfile.dart';
import 'package:firebase_lesson/Lesson_Two/Lesson_Two_Homework/LoginPage.dart';
import 'package:firebase_lesson/Lesson_Two/add_number_page.dart';
import 'package:firebase_lesson/Lesson_Two/verifyPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';


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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  CarPage(),
    );
  }
}

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
  String? email;
  String? image;
  String? id;
  String? emailTwo;
  String? nameTwo;

  bool hasData = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    try {
                      GoogleSignIn _googleSignIn = GoogleSignIn();
                      var data = await _googleSignIn.signIn();
                      print(data?.id);
                      print(data?.email);
                      print(data?.photoUrl);
                      print(data?.displayName);
                      avatar = data?.photoUrl;
                      name = data?.displayName;
                      email = data?.email;
                      setState(() {});
                      _googleSignIn.signOut();
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Container(
                    height: 60,
                    child: Image.asset("assets/google.png"),
                  ),
                ),
                // avatar == null ? SizedBox.shrink() : Image.network(avatar ?? ""),
                // name == null ? SizedBox.shrink() : Text(name ?? ""),
                // email == null ? SizedBox.shrink() : Text(email ?? ""),
                GestureDetector(
                  onTap: () async {
                    final fb = FacebookLogin();

// Log in
                    final res = await fb.logIn(permissions: [
                      FacebookPermission.publicProfile,
                      FacebookPermission.email,
                    ]);

// Check result status
                    switch (res.status) {
                      case FacebookLoginStatus.success:
                      // Logged in


                      // Send access token to server for validation and auth
                        final FacebookAccessToken? accessToken = res.accessToken;
                        print('Access token: ${accessToken?.token}');

                        // Get profile data
                        final profile = await fb.getUserProfile();
                        print('Hello, ${profile?.name}! You ID: ${profile?.userId}');

                        nameTwo = profile?.name;
                        id = profile?.userId;

                        // Get user profile image url
                        final imageUrl = await fb.getProfileImageUrl(width: 100);
                        print('Your profile image: $imageUrl');

                        image = imageUrl;

                        // Get email (since we request email permission)
                        final email = await fb.getUserEmail();
                        // But user can decline permission
                        if (email != null)
                          print('And your email is $email');
                        emailTwo = email;


                        break;
                      case FacebookLoginStatus.cancel:
                      // User cancel log in
                        break;
                      case FacebookLoginStatus.error:
                      // Log in failed
                        print('Error while log in: ${res.error}');
                        break;
                    };

                    setState(() {

                    });

                  }, child: Container(
                  height: 60,
                  margin: EdgeInsets.only(left: 22),
                  child: Image.asset("assets/facebook.png"),
                ),
                ),
                // image == null ? SizedBox.shrink() : Image.network(image ?? ""),
                // nameTwo == n/ull ? SizedBox.shrink() : Text(nameTwo ?? ""),
                // id == null ? SizedBox.shrink() : Text(id ?? ""),
                // emailTwo == null ? SizedBox.shrink() : Text(emailTwo ?? ""),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}