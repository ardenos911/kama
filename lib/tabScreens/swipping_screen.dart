import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwippingScreen extends StatefulWidget {
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        body: Center(
            child:Text(
              "Welcome to Your Home Page",
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 17,
              ),
            )
        )
    );
  }
}
