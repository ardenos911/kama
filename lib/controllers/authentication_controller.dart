import 'dart:io';

import 'package:kama_love/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kama_love/models/person.dart' as personModel;

import '../authenticationScreen/login_screen.dart';
import '../homeScreen/home_screen.dart';
import 'package:geolocator/geolocator.dart';



class AuthenticationController extends GetxController
{
  static AuthenticationController authController = Get.find();
  late Rx<User?> firebaseCurrentUser;

  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;


  pickImageFileFromGallery() async
  {  //user will be taken to their phone gallery

    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "you have successfully picked your profile image from galley.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));


  }

  captureImageFromPhoneCamera() async
  {

    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "you have successfully captured your profile image using camera.");
    }

     pickedFile = Rx<File?>(File(imageFile!.path));


  }

  Future<String> uploadImageToStorage(File imageFile) async
  {
    Reference referenceStorage = FirebaseStorage.instance.ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    String downloadUrlOfImage = await snapshot.ref.getDownloadURL();

    return downloadUrlOfImage;
  }

   createNewUserAccount(
       //personal info
       File imageProfile, String email, String password,
       String name, String age, String gender,
       String phoneNo, String city,
       String country, String profileHeading,
       String lookingForInaPartner,

       //Appearance
       String height, String weight, String bodyType,

       //Life style
       String drink, String smoking, String martialStatus,
       String haveChildren, String noOfChildren, String profession,
       String employmentStatus, String income, String livingSituation,
       String willingToRelocate, String relationshipYouAreLookingFor,

       //Background - Cultural Values
       String nationality, String education, String languageSpoken,
       String religion, String ethnicity,
       ) async
   {
     try
     {

       //3. authenticate user and create User With Email and Password
       UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
           email: email,
           password: password
       );

       //4. upload image to storage
       String urlOfDownloadedImage = await uploadImageToStorage(imageProfile);

       //5. save user info to firestore database
       personModel.Person personInstance = personModel.Person(

         //personal info
         uid: FirebaseAuth.instance.currentUser!.uid,
         imageProfile: urlOfDownloadedImage,
         email: email,
         password: password,
         name: name,
         age: int.parse(age),
         gender: gender.toLowerCase(),
         phoneNo: phoneNo,
         city: city,
         country: country,
         profileHeading: profileHeading,
         lookingForInaPartner: lookingForInaPartner,
         publishedDateTime: DateTime.now().millisecondsSinceEpoch,
         lat: position?.latitude,
         long: position?.longitude,

         //Appearance
         height: height,
         weight: weight,
         bodyType: bodyType,

         //Life style
         drink: drink,
         smoke: smoking,
         martialStatus: martialStatus,
         haveChildren: haveChildren,
         noOfChildren: noOfChildren,
         profession: profession,
         employmentStatus: employmentStatus,
         income: income,
         livingSituation: livingSituation,
         willingToRelocate: willingToRelocate,
         relationshipYouAreLookingFor: relationshipYouAreLookingFor,

         //Background - Cultural Values
         nationality: nationality,
         education: education,
         languageSpoken: languageSpoken,
         religion: religion,
         ethnicity: ethnicity,

       );

       //send the data to Firestore via the personInstance object we just created
       await FirebaseFirestore.instance.collection("users")
           .doc(FirebaseAuth.instance.currentUser!.uid)
           .set(personInstance.toJson());

       Get.snackbar("Account Created 🎁", "Congratulations ✨ 🎈, your account has been created.");
       Get.to(const HomeScreen());
     }
     catch(errorMsg)
     {
       Get.snackbar("Account Creation Unsuccessful", "Please try again-Fill in ALL fields");
     }


   }// end of createNewUserAccount()

    //Login user button functionality for login_screen.dart
  loginUser(String emailUser, String passwordUser) async
  {
    try
    {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailUser,
        password: passwordUser,
      );

      Get.snackbar("Log-in Successful ✔️", "you have logged-in successfully.");

      Get.to(HomeScreen());
    }
    catch(err)
    {
      Get.snackbar("Login Unsuccessful ⛔", "Please check your Email & Password");
    }
  }

    //validate if user is already logged in
  checkIfUserIsLoggedIn(User? currentUser)
  {
    if(currentUser == null)
    {
      Get.to(LoginScreen());
    }
    else
    {
      Get.to(HomeScreen());
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    //used Rx and Darts Generics, Rx<Type> to make firebaseCurrentUser- observable
    firebaseCurrentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    firebaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());

    /// future navigation based on auth state changes for firebaseCurrentUser
    ever(firebaseCurrentUser, checkIfUserIsLoggedIn);
  }

}// end of AuthenticationController{} class