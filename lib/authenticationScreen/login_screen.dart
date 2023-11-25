import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kama_love/authenticationScreen/forgot_pw_page.dart';
import 'package:kama_love/authenticationScreen/registration_screen.dart';
import 'package:kama_love/authenticationScreen/terms_conditions.dart';
import 'package:kama_love/widgets/custom_text_field_widget.dart';
import '../global.dart';
import '../controllers/authentication_controller.dart';
import 'package:geolocator/geolocator.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //logic for currentUser location and Permission setting
  Position? currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;
  String? _address;

  Future<Position?> _getCurrentLocation() async {
    try {
      servicePermission = await Geolocator.isLocationServiceEnabled();
      if (!servicePermission) {
        print("service disabled!!");
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      //code that will set the current user's Lat & long coordinates and send to Firestore
       currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      setState(() {
        position = currentLocation;
      });
      return currentLocation;
    }
     catch(errorMsg){
     Get.snackbar("you have an error", "${errorMsg}");
    }
  } //end of Future


  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('PLEASE NOTE'),
          content: Text('by clicking ok, you agree to our Privacy Policy along with our Tems & Conditions BEFORE using KAMA app'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();
  bool showProgressBar = false;

  var controllerAuth = AuthenticationController.authController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
          children: [
            const SizedBox(
              height:50,
            ),
             Image.asset(
                 "images/kama_logo.png",
                  width:200,
             ),
            const Text(
              "Welcome to Kama Dating",
              style:TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height:20,
            ),
            const Text(
              "Please login to start your journey",
              style:TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color:Colors.lightBlue,
              ),
            ),
            const SizedBox(
              height:20,
            ),

            //email section
            SizedBox(
              height:60,
              width:MediaQuery.of(context).size.width-40,
              child: CustomTextFieldWidget(
                editingController: emailTextEditingController,
                labelText: "Email",
                iconData: Icons.email_outlined,
                isObscure: false,
              ),
            ),

            const SizedBox(
              height:19,
            ),

            //password section
            SizedBox(
              height:60,
              width: MediaQuery.of(context).size.width-40,
              child: CustomTextFieldWidget(
                editingController: passwordTextEditingController,
                labelText: "Password",
                iconData: Icons.lock_outline,
                isObscure: true,
              ),
            ),

            const SizedBox(
              height:20,
            ),

            //Login Button
            Container(
              width: MediaQuery.of(context).size.width-60,
              height:55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: InkWell(
                // Login with email & password functionality button click---
                onTap: () async
                    {
                      if(emailTextEditingController.text.trim().isNotEmpty
                          && passwordTextEditingController.text.trim().isNotEmpty)
                      {
                        setState(() {
                          showProgressBar = true;
                        });

                        await controllerAuth.loginUser(
                            emailTextEditingController.text.trim(),
                            passwordTextEditingController.text.trim()
                        );

                        setState(() {
                          showProgressBar = false;
                        });
                      }
                      else
                      {
                        Get.snackbar("Email 📧/Password 🔐 is Missing", "Please fill all fields 😒.");
                      }
                    },
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height:30,
            ),

            //dont have an account -create here string
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
               const Text("   Don't have an account?  ",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.lightBlue,
                ),
                ),
                InkWell(
                  onTap: ()
                  { _getCurrentLocation();
                    Get.to(() => const RegistrationScreen());
                    showAlertDialog(context);
                  },
                  child: const Text(
                    "Register Here",
                      style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height:30,
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap: ()
                {
                  Get.to(() => const ForgotPasswordPage());
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height:15,
            ),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 20.0),
              child: InkWell(
                onTap: ()
                {
                  Get.to(() => const TermsAndConditionsPage());
                },
                child: const Text(
                  "Terms & Privacy Policy",
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            showProgressBar == true ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
            ) : Container(),

            const SizedBox(
              height:26,
            ),
          ],
        ),
       ),
      ),
    );
  }
}
