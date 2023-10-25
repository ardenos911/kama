import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class AuthenticationController extends GetxController
{
  static AuthenticationController authController = Get.find();

  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;

  pickImageFileFromGallery() async
  {  //user will be taken to their phone gallery
    final imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "you have successfully picked your profile image from the phone galley.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  captureImageFromPhoneCamera() async
  {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if(imageFile != null)
    {
      Get.snackbar("Profile Image", "you have successfully captured your profile image using phone camera.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }




}