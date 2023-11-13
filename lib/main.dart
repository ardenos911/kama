import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kama_love/authenticationScreen/login_screen.dart';
import 'package:kama_love/controllers/authentication_controller.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then( (value)
  {
    Get.put(AuthenticationController());
  });

 //get permission for receipt of push Notifications
  await Permission.notification.isDenied.then((value)
  {
    if(value)
    {
      Permission.notification.request();
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kama',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),

      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}


