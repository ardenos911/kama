import 'package:cloud_firestore/cloud_firestore.dart';

class Person
{
   //personal info
  String? uid;
  String? imageProfile;
  String? email;
  String? password;
  String? name;
  int? age;
  String? gender;
  String? phoneNo;
  String? city;
  String? country;
  String? profileHeading;
  String? lookingForInaPartner;
  int? publishedDateTime;

  //Appearance
  String? height;
  String? weight;
  String? bodyType;

  //Life style
  String? drink;
  String? smoke;
  String? martialStatus;
  String? haveChildren;
  String? noOfChildren;
  String? profession;
  String? employmentStatus;
  String? income;
  String? livingSituation;
  String? willingToRelocate;
  String? relationshipYouAreLookingFor;

  //Background - Cultural Values
  String? nationality;
  String? education;
  String? languageSpoken;
  String? religion;
  String? ethnicity;

    //constructor
  Person({
    //personal info
    this.uid,
    this.imageProfile,
    this.email,
    this.password,
    this.name,
    this.age,
    this.gender,
    this.phoneNo,
    this.city,
    this.country,
    this.profileHeading,
    this.lookingForInaPartner,
    this.publishedDateTime,

    //Appearance
    this.height,
    this.weight,
    this.bodyType,

    //Life style
    this.drink,
    this.smoke,
    this.martialStatus,
    this.haveChildren,
    this.noOfChildren,
    this.profession,
    this.employmentStatus,
    this.income,
    this.livingSituation,
    this.willingToRelocate,
    this.relationshipYouAreLookingFor,

    //Background - Cultural Values
    this.nationality,
    this.education,
    this.languageSpoken,
    this.religion,
    this.ethnicity,
  });





}
