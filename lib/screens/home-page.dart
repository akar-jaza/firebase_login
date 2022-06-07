// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, avoid_print, avoid_function_literals_in_foreach_calls, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/read%20data/get_user_data.dart';
import 'package:firebase_login/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  static const String id = 'home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // create a list of document IDs
  List<String> docIDs = [];

  // get doc IDs
  Future? _getDocIds;
  Future getDocIDs() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  /*hande zanyari...
    get(): fetch'y(wargrtni) document,
    (snapshot) ba dlli xota danwsi chy mn nwsiwma snapshot, 
    pashan laregay foreach twaniman hamw document'akan beninawa 
    https://www.youtube.com/watch?v=PBxbWZZTG2Q&t=26s
  */

  @override
  void initState() {
    _getDocIds = getDocIDs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.deepPurpleAccent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              //redirect to login page after signout button is pressed
              //it will clear all the paths and your history and launch LoginScreen
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },
            icon: Icon(Icons.logout_outlined),
          )
        ],
        title: Text(
          user.email!,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: _getDocIds,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: GetUserName(documentID: docIDs[index]),
                    );
                  }),
                  itemCount: docIDs.length,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
