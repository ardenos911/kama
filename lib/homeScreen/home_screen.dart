import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../tabScreens/favorite_sent_favorite_received_screen.dart';
import '../tabScreens/like_sent_like_received_screen.dart';
import '../tabScreens/swipping_screen.dart';
import '../tabScreens/user_details_screen.dart';
import '../tabScreens/view_sent_view_received_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int screenIndex = 0;

  List tabScreensList =
  [
    SwippingScreen(),
    ViewSentViewReceivedScreen(),
    FavoriteSentFavoriteReceivedScreen(),
    LikeSentLikeReceivedScreen(),
    UserDetailsScreen(userID: FirebaseAuth.instance.currentUser!.uid,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
       bottomNavigationBar: BottomNavigationBar(
         onTap: (indexNumber)
         {
           setState(() {
             screenIndex = indexNumber;
           });
         },
         type:BottomNavigationBarType.fixed,
         backgroundColor: Colors.black45,
         selectedItemColor: Colors.white,
         unselectedItemColor: Colors.lightBlue,
         currentIndex: screenIndex,
       ),
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