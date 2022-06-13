// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../screens/home-page.dart';

// class SignInAuth extends StatelessWidget {
//   static final emailController = TextEditingController();
//   static final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     Center? ProgressIndicator(bool showDialog) {
//       if (showDialog = true) {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       } else {
//         return null;
//       }
//     }

//     Future<dynamic> signIn() async {
//       try {
//         //* loading widget
//         ProgressIndicator(true);
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: emailController.text.trim(),
//           password: passwordController.text.trim(),
//         );
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       } on FirebaseAuthException catch (e) {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content: Text(e.message.toString()),
//             );
//           },
//         );
//         print(e);
//       }
//     }

//     Future signInauthenication = signIn();

//     throw UnimplementedError();
//   }
// }
