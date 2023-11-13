import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';


Future<double> calculateDistance(String uid1, String uid2) async {
  DocumentSnapshot doc1 = await FirebaseFirestore.instance.collection('users').doc(uid1).get();
  DocumentSnapshot doc2 = await FirebaseFirestore.instance.collection('users').doc(uid2).get();

  double startLatitude = doc1.data()!["lat"];
  double startLongitude = doc1.data()!['long'];
  double endLatitude = doc2.data()!['lat'];
  double endLongitude = doc2.data()!['long'];

  double distanceInMeters = Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude);

  // Convert the distance to miles
  double distanceInMiles = distanceInMeters / 1609.34;

  return distanceInMiles;
}