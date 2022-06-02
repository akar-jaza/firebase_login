// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class EmailTextfieldWidget extends StatelessWidget {
  final FocusNode myFocusNode = FocusNode();
  EmailTextfieldWidget({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.textInputType,
  });
  final String hintText;

  final TextInputType? textInputType;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: TextFormField(
        cursorColor: Colors.black,
        keyboardType: textInputType,
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

class PasswordTextfieldWidget extends StatefulWidget {
  PasswordTextfieldWidget({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.textInputType,
  });
  final String hintText;

  final TextInputType? textInputType;
  final TextEditingController textEditingController;

  @override
  State<PasswordTextfieldWidget> createState() =>
      _PasswordTextfieldWidgetState();
}

class _PasswordTextfieldWidgetState extends State<PasswordTextfieldWidget> {
  final FocusNode myFocusNode = FocusNode();

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: TextFormField(
        cursorColor: Colors.black,
        keyboardType: widget.textInputType,
        obscureText: !passwordVisible,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            icon: Icon(
              // Based on passwordVisible state choose the icon
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: !passwordVisible ? Colors.grey : Colors.deepPurple,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          labelText: widget.hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
