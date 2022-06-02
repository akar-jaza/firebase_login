// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final FocusNode myFocusNode = FocusNode();
  TextfieldWidget({
    Key? key,
    required this.hintText,
    required this.obsecureText,
    required this.textEditingController,
    this.textInputType,
  });
  final String hintText;
  final bool obsecureText;
  final TextInputType? textInputType;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: TextFormField(
        cursorColor: Colors.black,
        keyboardType: textInputType,
        obscureText: obsecureText,
        controller: textEditingController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          labelText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
