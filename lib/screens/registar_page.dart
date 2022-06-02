// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:firebase_login/screens/login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../widgets/textButton.dart';
import '../widgets/textfield.dart';
import 'dart:io' show Platform;
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmedController = TextEditingController();

  bool isLoading = false;
  Future signUp() async {
    if (passwordConfirmed()) {
      try {
        isLoading = true;
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print('Failed with error code: ${e.code}');
        print(e.message);
      }
    } else {
      SnackBar(
        content: const Text('passowrd is not equal!'),
      );
    }
  }

  bool passwordConfirmed() {
    if (_passwordController == _passwordConfirmedController) {
      return true;
    } else {
      return false;
    }
  }

  // for ram management
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmedController.dispose();
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
    try {
      if (Platform.isWindows) {
        padding = 25;
      } else if (Platform.isAndroid) {
        padding = 20;
      } else {
        padding = 20;
      }
    } catch (e) {
      if (kIsWeb) {
        padding = 25;
      }
    }
    // Platform.isWindows ? padding = 25 : padding = 20;
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
                    'HELLO THERE!',
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(fontSize: 50),
                    ),
                  ),
                  // SizedBox(height: 5),
                  Text(
                    "Registar belew with your detail",
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
                    textEditingController: _passwordController,
                    hintText: 'Password',
                    obsecureText: true,
                  ),
                  SizedBox(height: 10),

                  TextfieldWidget(
                    textEditingController: _passwordConfirmedController,
                    hintText: 'Confirm Password',
                    obsecureText: true,
                  ),
                  SizedBox(height: 10),

                  //* sign up button
                  TextButtonWidget(
                    onPressed: signUp,
                    title: 'Sign Up',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // GoogleSignInBtn(
                  //   onPressed: () {},
                  // ),
                  SizedBox(height: 25),
                  //* not a memebr? sign in now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "I'm a member!",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        style: ButtonStyle(),
                        child: Text(
                          'Log In',
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
