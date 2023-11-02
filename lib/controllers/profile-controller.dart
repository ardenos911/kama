import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/person.dart';

class ProfileController extends GetxController
{
  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);
  List<Person> get allUsersProfileList => usersProfileList.value;

  getResults()
  {
    onInit();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if(chosenGender == null || chosenCountry == null || chosenAge == null)
    {
      usersProfileList.bindStream(
          FirebaseFirestore.instance
              .collection("users")
              .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots()
              .map((QuerySnapshot queryDataSnapshot)
          {
            List<Person> profilesList = [];

            for(var eachProfile in queryDataSnapshot.docs)
            {
              profilesList.add(Person.fromDataSnapshot(eachProfile));
            }
            return profilesList;
          })
      );
    }
    else
    {
      usersProfileList.bindStream(
          FirebaseFirestore.instance
              .collection("users")
              .where("gender", isEqualTo: chosenGender.toString().toLowerCase())
              .where("country", isEqualTo: chosenCountry.toString())
              .where("age", isGreaterThanOrEqualTo: int.parse(chosenAge.toString()))
              .snapshots()
              .map((QuerySnapshot queryDataSnapshot)
          {
            List<Person> profilesList = [];

            for(var eachProfile in queryDataSnapshot.docs)
            {
              profilesList.add(Person.fromDataSnapshot(eachProfile));
            }
            return profilesList;
          })
      );
    }
  }// end of onInit()

}