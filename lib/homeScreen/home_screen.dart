import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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