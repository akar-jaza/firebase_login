// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';

class GoogleSignInBtn extends StatelessWidget {
  GoogleSignInBtn({
    required this.onPressed,
  });

  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(25, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 1.2,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          
          overlayColor: MaterialStateProperty.all(Color.fromARGB(27, 33, 149, 243)),
          // splashFactory: InteractiveInkFeatureFactory(),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/google_icon.png',
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Text(
                'Sign In with Google',
                style: TextStyle(color: Color(0xff757575), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
