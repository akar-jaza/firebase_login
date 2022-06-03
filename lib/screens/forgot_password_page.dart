// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/responsive/responsive.dart';
import 'package:firebase_login/widgets/textButton.dart';
import 'package:firebase_login/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  // @override
  // void initState() {
  //   _emailController.dispose();
  //   super.initState();
  // }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('password reset lint sent! please check your E-mail'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Color(0xffF8F8F8),
        statusBarColor: Colors.deepPurple[200],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
      ),
      body: Padding(
        padding: EdgeInsets.all(responsivePadding()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your email and we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            EmailTextfieldWidget(
              hintText: 'email',
              textEditingController: _emailController,
            ),
            SizedBox(
              height: 15,
            ),
            TextButtonWidget(
              onPressed: () {
                passwordReset();
              },
              title: 'Reset Password',
            )
          ],
        ),
      ),
    );
  }
}
