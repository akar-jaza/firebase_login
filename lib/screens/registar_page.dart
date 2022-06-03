// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'package:firebase_login/responsive/responsive.dart';
import 'package:firebase_login/screens/home-page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../widgets/textButton.dart';
import '../widgets/textfield.dart';
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } on FirebaseAuthException catch (e) {
        print('Failed with error code: ${e.code}');
        print(e.message);
      }
    } else if (passwordConfirmed() == false) {
      print('password is not equal');
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _passwordConfirmedController.text.trim()) {
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

    // Platform.isWindows ? padding = 25 : padding = 20;
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(responsivePadding()),
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
                  EmailTextfieldWidget(
                    textEditingController: _emailController,
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),

                  //* password textfield
                  PasswordTextfieldWidget(
                    textEditingController: _passwordController,
                    hintText: 'Password',
                  ),
                  SizedBox(height: 10),

                  PasswordTextfieldWidget(
                    textEditingController: _passwordConfirmedController,
                    hintText: 'Confirm Password',
                  ),
                  SizedBox(height: 10),

                  //* sign up button
                  TextButtonWidget(
                    onPressed: signUp,
                    title: 'Sign Up',
                    icon: Icon(Icons.email_outlined),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // GoogleSignInBtn(
                  //   onPressed: () {},
                  // ),
                  SizedBox(height: 25),
                  //*Already a member? log in
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "I'm a member!",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
