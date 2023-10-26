import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/authentication_controller.dart';
import '../widgets/custom_text_field_widget.dart';

class RegistrationScreen extends StatefulWidget
{
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController = TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController = TextEditingController();

  //Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTypeTextEditingController = TextEditingController();

  //Life Style
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokingTextEditingController = TextEditingController();
  TextEditingController maritalStatusTextEditingController = TextEditingController();
  TextEditingController haveChildrenTextEditingController = TextEditingController();
  TextEditingController noOfChildrenTextEditingController = TextEditingController();
  TextEditingController professionTextEditingController = TextEditingController();
  TextEditingController employmentStatusTextEditingController = TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController = TextEditingController();
  TextEditingController willingToRelocateTextEditingController = TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController = TextEditingController();

  //Background-cultural values
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController = TextEditingController();
  TextEditingController languageSpokenTextEditingController = TextEditingController();
  TextEditingController religionTextEditingController = TextEditingController();
  TextEditingController ethnicityTextEditingController = TextEditingController();
  //Progress Bar
  bool showProgressBar = false;

  var authenticationController = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height: 80,
              ),

              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "and get started now",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,

                ),
              ),

              const SizedBox(
                height: 14,
              ),

              //select image circle avatar
              authenticationController.imageFile == null ?
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                    "images/kama_avatar.png"
                ),
                backgroundColor: Colors.black,
              ) :
          Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
          image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: FileImage(
          File(
          authenticationController.imageFile!.path,
          ),
        ),
       ),
     ),
          ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  IconButton(
                    onPressed: () async
                    {
                       await authenticationController.pickImageFileFromGallery();
                       setState(() {
                         authenticationController.imageFile;
                       });
                    },
                    icon: const Icon(
                      Icons.image_outlined,
                      color: Colors.deepPurpleAccent,
                      size:40,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  IconButton(
                    onPressed: () async
                    {
                      await authenticationController.captureImageFromPhoneCamera();
                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.deepPurpleAccent,
                      size:40,
                    ),
                  ),

                ],
              ),

              const SizedBox(
                height: 25,
              ),

              //********** PERSONAL INFO *****************
              const Text("Enter Personal Info :",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              //name section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  labelText: "Name",
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //email section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: emailTextEditingController,
                  labelText: "Email",
                  iconData: Icons.email_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //password section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: passwordTextEditingController,
                  labelText: "Password",
                  iconData: Icons.lock_outline,
                  isObscure: true,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //age section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: "Age",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //phoneNo section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: phoneNoTextEditingController,
                  labelText: "Phone Number",
                  iconData: Icons.phone_android_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //city section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: "City",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //country section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: "Country",
                  iconData: Icons.emoji_flags_sharp,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //profileHeading section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: profileHeadingTextEditingController,
                  labelText: "Profile",
                  iconData: Icons.face,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //lookingForInaPartner
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: lookingForInaPartnerTextEditingController,
                  labelText: "Describe Your Ideal Mate",
                  iconData: Icons.text_snippet_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //********* Appearance *********
              const Text("Physical Stats:",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              //height section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: heightTextEditingController,
                  labelText: "Height",
                  iconData: Icons.insert_chart,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //weight section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: weightTextEditingController,
                  labelText: "Weight",
                  iconData: Icons.fastfood_sharp,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //body type section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: bodyTypeTextEditingController,
                  labelText: "Body Type",
                  iconData: Icons.boy_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //********* Lifestyle *********
              const Text("Lifestyle:",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              //drink section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: drinkTextEditingController,
                  labelText: "Alcohol Consumption",
                  iconData: Icons.no_drinks_sharp,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //smoking section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: smokingTextEditingController,
                  labelText: "Smoker?",
                  iconData: Icons.smoke_free_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //marital status section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: maritalStatusTextEditingController,
                  labelText: "Marital Status",
                  iconData: Icons.people_alt_rounded,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //have children section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: haveChildrenTextEditingController,
                  labelText: "Are you a parent?",
                  iconData: Icons.baby_changing_station,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //number of children section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: noOfChildrenTextEditingController,
                  labelText: "Number of children?",
                  iconData: Icons.child_friendly,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //profession section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: professionTextEditingController,
                  labelText: "Profession",
                  iconData: Icons.business,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //employment section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: employmentStatusTextEditingController,
                  labelText: "Employment Status",
                  iconData: Icons.work_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),


              //income section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: incomeTextEditingController,
                  labelText: "Yearly Income",
                  iconData: Icons.monetization_on_rounded,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //living situation section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: livingSituationTextEditingController,
                  labelText: "Living situation",
                  iconData: Icons.bed_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //willing to relocate section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: willingToRelocateTextEditingController,
                  labelText: "Willing to relocate for love?",
                  iconData: Icons.airplanemode_active_rounded,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //relationship you are looking for
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: relationshipYouAreLookingForTextEditingController,
                  labelText: "Type of relationship desired",
                  iconData: Icons.people_alt_sharp,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              // ********* Background-Culture values *********
              const Text("Background/Culture :",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              // nationality section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: nationalityTextEditingController,
                  labelText: "Nationality",
                  iconData: Icons.recent_actors_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //education section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: educationTextEditingController,
                  labelText: "Level of education",
                  iconData: Icons.school_rounded,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //language section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: languageSpokenTextEditingController,
                  labelText: "Number of Languages spoken",
                  iconData: Icons.language_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              // religion sections
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: religionTextEditingController,
                  labelText: "Religion",
                  iconData: Icons.church,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //ethnicity section
              SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 40,
                child: CustomTextFieldWidget(
                  editingController: ethnicityTextEditingController,
                  labelText: "Ethnicity",
                  iconData: Icons.landscape_rounded,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              //create account button
              Container(
                width: MediaQuery.of(context).size.width-40,
                height:50,
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
                      "Create Account",
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
                height:15,
              ),

              //already have an account -login here string
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  const Text("   Already have an account?  ",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.lightBlue,
                    ),
                  ),
                  InkWell(
                    onTap: ()
                    {
                      Get.back();
                    },
                    child: const Text(
                      "Login Here",
                      style: TextStyle(
                        fontSize: 13,
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
