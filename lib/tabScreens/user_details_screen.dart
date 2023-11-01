import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends StatefulWidget {

  String? userID;
  UserDetailsScreen({super.key, this.userID,});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.red[900], // <-- SEE HERE
            statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
            statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
          ),
          backgroundColor: Colors.red[900],
          title: const Text(
            "User Profile",
            style:TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(
                Icons.logout_sharp,
                size:27,
              ),
            ),
          ],
        ),
        body: Center(
            child:Text(
              "Welcome to User Details Screen",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14,
              ),
            )
        )
    );
  }
}
