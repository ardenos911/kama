import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

   TextEditingController emailController= TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
   try {
     await FirebaseAuth.instance.sendPasswordResetEmail(
         email: emailController.text.trim());
     showDialog(
         context: context,
         builder: (context){
           return  AlertDialog(
             content: Text('Password reset link sent! 💨 Check your email'),
           );
         });
   } on FirebaseAuthException catch (e){
     print(e);
     showDialog(
         context: context,
         builder: (context){
       return AlertDialog(
         content: Text(e.message.toString()),
       );
     });
   }
  }// end of passwordReset

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.black,
        elevation:2,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/forgotpasswd.png'),
              fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.dstATop),),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const SizedBox(
                height:30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal:20.0),
                child: Text('Enter Your Email and we will send you a password reset link 📩',
                textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight:FontWeight.bold,
                        color:Colors.white,
                         fontSize:14,
                    ),
                ),
              ),

              const SizedBox(
                height:30,
              ),
              SizedBox(
                height:63,
                width:MediaQuery.of(context).size.width-40,
                child: CustomTextFieldWidget(
                  editingController: emailController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),
              const SizedBox(
                height:30,
              ),
              MaterialButton (
                onPressed:() async{
                 await passwordReset();
                },
                color: Colors.blueAccent,
                child: const Text('Reset Password 🔐',
                style: TextStyle(
                 fontWeight:FontWeight.bold,
                  color:Colors.white,),
                    ),
              ),
          ]
        ),
      )
    );
  }
}
