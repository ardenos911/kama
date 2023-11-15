import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

String currentUserID = FirebaseAuth.instance.currentUser!.uid;
String? chosenAge;
String? chosenCountry;
String? chosenGender;
String? chosenCity;
Position? position;
String? chosenMiles;
String fcmServerToken = "key=AAAA0_ioidk:APA91bG-nLGczqhOxE0TjLHBg5ROP-hzCBx5LmnqiH8opV-lHsiljd6zOAoTsDqu3jPTkaW5HDozTsFilKNUe8IfrMvYTo6C2-hWCkzLcnLA1mJ9L-AaD_NHta2rRG5oOdr8aHUzWD3I";