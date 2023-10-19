import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kama_love/authenticationScreen/registration_screen.dart';
import 'package:kama_love/widgets/custom_text_field_widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();
  bool showProgressBar = false;
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
                  width:300,
             ),
            const Text(
              "Welcome to Kama Dating",
              style:TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height:20,
            ),
            const Text(
              "Please login to start your journey",
              style:TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height:29,
            ),

            //email section
            SizedBox(
              width:MediaQuery.of(context).size.width-20,
              child: CustomTextFieldWidget(
                editingController: emailTextEditingController,
                labelText: "Email",
                iconData: Icons.email_outlined,
                isObscure: false,
              ),
            ),

            const SizedBox(
              height:15,
            ),

            //password section
            SizedBox(
              width: MediaQuery.of(context).size.width-20,
              child: CustomTextFieldWidget(
                editingController: passwordTextEditingController,
                labelText: "Password",
                iconData: Icons.lock_outline,
                isObscure: true,
              ),
            ),

            const SizedBox(
              height:15,
            ),

            //Login Button
            Container(
              width: MediaQuery.of(context).size.width-20,
              height:55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: InkWell(
                onTap: ()
                    {

                    },
                child: const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height:15,
            ),

            //dont have an account -create here string
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
               const Text("   Don't have an account?  ",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.lightBlue,
                ),
                ),
                InkWell(
                  onTap: ()
                  {
                    Get.to(RegistrationScreen());
                  },
                  child: const Text(
                    "Register an Account Here",
                      style: TextStyle(
                      fontSize: 17,
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
          ],
        ),
       ),
      ),
    );
  }
}
