import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kama_love/authenticationScreen/registration_screen.dart';
import 'package:kama_love/widgets/custom_text_field_widget.dart';

import '../controllers/authentication_controller.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
              height:50,
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
              height:50,
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
                        Get.snackbar("Email/Password is Missing", "Please fill all fields.");
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
                  {
                    Get.to(() => const RegistrationScreen());
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
              height:15,
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
