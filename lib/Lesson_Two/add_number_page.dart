import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_lesson/Lesson_Two/verifyPage.dart';
import 'package:flutter/material.dart';

class AddNumber extends StatefulWidget {
  const AddNumber({Key? key}) : super(key: key);

  @override
  State<AddNumber> createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: TextFormField(
            controller: controller,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: controller.text,
            verificationCompleted: (PhoneAuthCredential credential) {
              print(credential.toString());
            },
            verificationFailed: (FirebaseAuthException e) {
              print(e.toString());
            },
            codeSent: (String verificationId, int? resendToken) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => VerfPage(
                        id: verificationId,
                      )));
            },
            codeAutoRetrievalTimeout: (String verificationId) {},
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}