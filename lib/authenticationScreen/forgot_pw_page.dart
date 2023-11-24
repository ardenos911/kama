import 'package:flutter/material.dart';

import '../widgets/custom_text_field_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.redAccent,
        elevation:2,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const SizedBox(
              height:30,
            ),
            const Text('Enter Your Email and we will send you a password reset link',
            textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight:FontWeight.bold,
                    color:Colors.redAccent,
                     fontSize:14,
                ),
            ),

            const SizedBox(
              height:30,
            ),
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
              height:30,
            ),
            MaterialButton(
              onPressed:(){

              },
              color: Colors.deepPurple[200],
              child: const Text('Reset Password',
              style: TextStyle(
               fontWeight:FontWeight.bold,
                color:Colors.black),
                  ),
            ),
        ]
      )
    );
  }
}
