import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LikeSentLikeReceivedScreen extends StatefulWidget {
  const LikeSentLikeReceivedScreen({super.key});

  @override
  State<LikeSentLikeReceivedScreen> createState() => _LikeSentLikeReceivedScreenState();
}

class _LikeSentLikeReceivedScreenState extends State<LikeSentLikeReceivedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        body: Center(
            child:Text(
              "Welcome to Like Sent Like Received Screen",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 17,
              ),
            )
        )
    );
  }
}
