import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



class AuthenticationController extends GetxController
{
  static AuthenticationController authController = Get.find();

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

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "you have successfully picked your profile image from the phone galley.");
    }

  }

  captureImageFromPhoneCamera() async
  {

    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "you have successfully captured your profile image using camera.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));


    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "you have successfully captured your profile image using phone camera.");
    }

  }




}