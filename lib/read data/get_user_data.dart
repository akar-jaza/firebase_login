// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_print, avoid_function_literals_in_foreach_calls, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentID;
  GetUserName({required this.documentID});

  // get the collection
  CollectionReference user = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(documentID).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('First Name: ${data['firstName']}');
          // note: <Map<String, dynamic> >>> (users/rteqMVReLQRYPYBMDFj6)
        }
        return Text('Loading..');
      },
    );
  }
}
