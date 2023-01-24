import 'package:firebase_lesson/Lesson_Two/Lesson_Two_Homework/facebookProfile.dart';
import 'package:firebase_lesson/Lesson_Two/Lesson_Two_Homework/googleProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};


class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null!;
    });
  }



  @override

  String? avatar;

  String? name;

  String? email;

  String? facebookemail;
  String? facebookrasm;
  String? facebookism;
  String? facebookid;



  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ECORP',
      logo: AssetImage('assets/logo.png'),
      onLogin: _authUser,
      onSignup: _signupUser,

      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: () async {
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

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => GoogleProfile(rasm: avatar ?? '', ism: name ?? '',emailRaqam: email ?? ''),
                  ));

                } catch (e) {
                  print(e);
                };
              child: Container(
                height: 60,
                child: Image.asset("assets/logo.png"),
              );
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          label: 'Facebook',
          callback: () async {
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

                facebookism = profile?.name;
                facebookid = profile?.userId;

                // Get user profile image url
                final imageUrl = await fb.getProfileImageUrl(width: 100);
                print('Your profile image: $imageUrl');

                facebookrasm = imageUrl;

                // Get email (since we request email permission)
                final email = await fb.getUserEmail();
                // But user can decline permission
                if (email != null)
                  print('And your email is $email');
                facebookemail = email;


                break;
              case FacebookLoginStatus.cancel:
              // User cancel log in
                break;
              case FacebookLoginStatus.error:
              // Log in failed
                print('Error while log in: ${res.error}');
                break;
            };

            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => FacebookProfile(facebookRasm: facebookrasm ?? '', facebookIsm: facebookism ?? '', facebookidNomer: facebookid ?? '', facebookemailRaqam: facebookemail ?? '',),
            ));

          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.linkedinIn,
          callback: () async {
            debugPrint('start linkdin sign in');
            await Future.delayed(loginTime);
            debugPrint('stop linkdin sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.githubAlt,
          callback: () async {
            debugPrint('start github sign in');
            await Future.delayed(loginTime);
            debugPrint('stop github sign in');
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {

      },
      onRecoverPassword: _recoverPassword,
    );
  }
}