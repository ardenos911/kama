import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';


  Future<String> calculateDistance(String uid1, String uid2) async {
  DocumentSnapshot doc1 = await FirebaseFirestore.instance.collection('users').doc(uid1).get();
  DocumentSnapshot doc2 = await FirebaseFirestore.instance.collection('users').doc(uid2).get();

  double startLatitude = doc1.get('lat');
  double startLongitude = doc1.get('long');
  double endLatitude = doc2.get('lat');
  double endLongitude = doc2.get('long');

  double distanceInMeters = Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude);

  // Convert the distance to miles
  int distanceInMiles = (distanceInMeters / 1609.34).round();
  String milesAway= distanceInMiles.toString();
  return milesAway;
}