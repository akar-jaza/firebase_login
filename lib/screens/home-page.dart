// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const String id = 'home-page';
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(systemNavigationBarColor: Colors.white));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('signed in as: ${user.email!}'),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                //redirect to login page after signout button is pressed
                //it will clear all the paths and your history and launch LoginScreen
                Navigator.of(context).pushAndRemoveUntil(
                     MaterialPageRoute(
                        builder: (context) =>  LoginPage()),
                    (route) => false);
              },
              child: Text('sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
