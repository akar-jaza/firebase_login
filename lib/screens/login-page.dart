// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../widgets/google-signIn-btn.dart';
import '../widgets/textButton.dart';
import '../widgets/textfield.dart';
import 'dart:io' show Platform;
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String id = 'first-screen';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passswordController = TextEditingController();

  bool isLoading = false;
  Future signIn() async {
    isLoading = true;
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      
      email: _emailController.text.trim(),
      password: _passswordController.text.trim(),
    );
  }

  // for ram management
  @override
  void dispose() {
    _emailController.dispose();
    _passswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Color(0xffF8F8F8),
        statusBarColor: Color(0xffF8F8F8),
      ),
    );
    double padding = 0;
    Platform.isWindows ? padding = 25 : padding = 20;
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //* hello again!
                  Icon(
                    Icons.android_outlined,
                    size: 100,
                  ),
                  SizedBox(height: 50),
                  Text(
                    'HELLO AGAIN!',
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(fontSize: 50),
                    ),
                  ),
                  // SizedBox(height: 5),
                  Text(
                    "Welcome back, you've been missed!",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 50),

                  //* email textfield
                  TextfieldWidget(
                    textEditingController: _emailController,
                    hintText: 'Email',
                    obsecureText: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),

                  //* password textfield
                  TextfieldWidget(
                    textEditingController: _passswordController,
                    hintText: 'password',
                    obsecureText: true,
                  ),
                  SizedBox(height: 10),

                  //* sign in button
                  TextButtonWidget(
                    onPressed: signIn,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GoogleSignInBtn(
                    onPressed: () {},
                  ),
                  SizedBox(height: 25),
                  //* not a memebr? sign in now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Not a member?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(),
                        child: Text(
                          'Registar now',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
