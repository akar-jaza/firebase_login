// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/screens/registar_page.dart';
import 'package:flutter/material.dart';

import '../screens/home-page.dart';

// main-page: seeing if we are logged in or not
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const String id = 'main-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //User? : checking non null user
      body: StreamBuilder<User?>(
        // authStateChanges() : listen for any auth changes, user logged in or not
        stream: FirebaseAuth.instance.authStateChanges(),
        //snapshot: gives us information for the user
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}
