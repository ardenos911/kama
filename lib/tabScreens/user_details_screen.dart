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


  //personal info
  String name = '';
  String age = '';
  String phoneNo = '';
  String city = '';
  String country = '';
  String profileHeading = '';
  String lookingForInaPartner = '';

  //Appearance
  String height = '';
  String weight = '';
  String bodyType = '';

  //Life style
  String drink = '';
  String smoke = '';
  String martialStatus = '';
  String haveChildren = '';
  String noOfChildren = '';
  String profession = '';
  String employmentStatus = '';
  String income = '';
  String livingSituation = '';
  String willingToRelocate = '';
  String relationshipYouAreLookingFor = '';

  //Background - Cultural Values
  String nationality = '';
  String education = '';
  String languageSpoken = '';
  String religion = '';
  String ethnicity = '';

  //slider images
  String urlImage1 = "https://firebasestorage.googleapis.com/v0/b/kama-9ee34.appspot.com/o/Place%20Holder%2Fkama_avatar.png?alt=media&token=f78117e1-084d-4253-b2a0-8f9d4873c5a3";
  String urlImage2 = "https://firebasestorage.googleapis.com/v0/b/kama-9ee34.appspot.com/o/Place%20Holder%2Fkama_avatar.png?alt=media&token=f78117e1-084d-4253-b2a0-8f9d4873c5a3";
  String urlImage3 = "https://firebasestorage.googleapis.com/v0/b/kama-9ee34.appspot.com/o/Place%20Holder%2Fkama_avatar.png?alt=media&token=f78117e1-084d-4253-b2a0-8f9d4873c5a3";
  String urlImage4 = "https://firebasestorage.googleapis.com/v0/b/kama-9ee34.appspot.com/o/Place%20Holder%2Fkama_avatar.png?alt=media&token=f78117e1-084d-4253-b2a0-8f9d4873c5a3";
  String urlImage5 = "https://firebasestorage.googleapis.com/v0/b/kama-9ee34.appspot.com/o/Place%20Holder%2Fkama_avatar.png?alt=media&token=f78117e1-084d-4253-b2a0-8f9d4873c5a3";


  retrieveUserInfo() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userID)
        .get()
        .then((snapshot)
    {
      if(snapshot.exists)
      {
        if(snapshot.data()!["urlImage1"] != null)
        {
          setState(() {
            urlImage1 = snapshot.data()!["urlImage1"];
            urlImage2 = snapshot.data()!["urlImage2"];
            urlImage3 = snapshot.data()!["urlImage3"];
            urlImage4 = snapshot.data()!["urlImage4"];
            urlImage5 = snapshot.data()!["urlImage5"];
          });
        }

        setState(() {
          //personal info
          name = snapshot.data()!["name"];
          age = snapshot.data()!['age'].toString();
          phoneNo = snapshot.data()!['phoneNo'];
          city = snapshot.data()!['city'];
          country = snapshot.data()!['country'];
          profileHeading = snapshot.data()!['profileHeading'];
          lookingForInaPartner = snapshot.data()!['lookingForInaPartner'];

          //Appearance
          height = snapshot.data()!['height'];
          weight = snapshot.data()!['weight'];
          bodyType = snapshot.data()!['bodyType'];

          //Life style
          drink = snapshot.data()!['drink'];
          smoke = snapshot.data()!['smoke'];
          martialStatus = snapshot.data()!['martialStatus'];
          haveChildren = snapshot.data()!['haveChildren'];
          noOfChildren = snapshot.data()!['noOfChildren'];
          profession = snapshot.data()!['profession'];
          employmentStatus = snapshot.data()!['employmentStatus'];
          income = snapshot.data()!['income'];
          livingSituation = snapshot.data()!['livingSituation'];
          willingToRelocate = snapshot.data()!['willingToRelocate'];
          relationshipYouAreLookingFor = snapshot.data()!['relationshipYouAreLookingFor'];

          //Background - Cultural Values
          nationality = snapshot.data()!['nationality'];
          education = snapshot.data()!['education'];
          languageSpoken = snapshot.data()!['languageSpoken'];
          religion = snapshot.data()!['religion'];
          ethnicity = snapshot.data()!['ethnicity'];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserInfo();
  }


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
