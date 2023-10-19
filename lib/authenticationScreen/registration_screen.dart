import 'package:flutter/material.dart';

import '../widgets/custom_text_field_widget.dart';

class RegistrationScreen extends StatefulWidget
{
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
{
  //personal info
  TextEditingController emailTextEditingController= TextEditingController();
  TextEditingController passwordTextEditingController= TextEditingController();
  TextEditingController nameTextEditingController= TextEditingController();
  TextEditingController ageTextEditingController= TextEditingController();
  TextEditingController phoneNoTextEditingController= TextEditingController();
  TextEditingController cityTextEditingController= TextEditingController();
  TextEditingController countryTextEditingController= TextEditingController();
  TextEditingController profileHeadingTextEditingController= TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController= TextEditingController();

  //Appearance
  TextEditingController heightTextEditingController= TextEditingController();
  TextEditingController weightTextEditingController= TextEditingController();
  TextEditingController bodyTypeTextEditingController= TextEditingController();

  //Life Style
  TextEditingController drinkTextEditingController= TextEditingController();
  TextEditingController smokingTextEditingController= TextEditingController();
  TextEditingController maritalStatusTextEditingController= TextEditingController();
  TextEditingController haveChildrenTextEditingController= TextEditingController();
  TextEditingController noOfChildrenTextEditingController= TextEditingController();
  TextEditingController professionTextEditingController= TextEditingController();
  TextEditingController employmentStatusTextEditingController= TextEditingController();
  TextEditingController incomeTextEditingController= TextEditingController();
  TextEditingController livingSituationTextEditingController= TextEditingController();
  TextEditingController willingToRelocateTextEditingController= TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController= TextEditingController();

  //Background-cultural values
  TextEditingController nationalityTextEditingController= TextEditingController();
  TextEditingController educationTextEditingController= TextEditingController();
  TextEditingController languageSpokenTextEditingController= TextEditingController();
  TextEditingController religionTextEditingController= TextEditingController();
  TextEditingController ethnicityTextEditingController= TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height:80,
              ),

              const  Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 34,
                  color:Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height:10,
              ),

              const  Text(
                "and get started now",
                style: TextStyle(
                  fontSize: 23,
                  color:Colors.white60,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height:14,
              ),

              //select image circle avatar
              GestureDetector(
                onTap: ()
                {

                },
                child: const CircleAvatar(
                  radius:80,
                  backgroundImage: AssetImage(
                    "images/kama_avatar.png"
                  ),
                  backgroundColor: Colors.black,
                ),
              ),

              const SizedBox(
                height:25,
              ),

              //**********PERSONAL INFO *****************
              const Text("Enter Personal Info :",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                ),
              ),

              const SizedBox(
                height:8,
              ),

              //name section
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  labelText: "Name",
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
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
                height:18,
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
                height:18,
              ),

              //age section
              SizedBox(
                width: MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: "Age",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

              //phoneNo section
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: phoneNoTextEditingController,
                  labelText: "Phone Number",
                  iconData: Icons.phone_android_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

              //city section
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: "City",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

              //country section
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: "Country",
                  iconData: Icons.emoji_flags_sharp,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

              //profileHeading section
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: profileHeadingTextEditingController,
                  labelText: "Profile",
                  iconData: Icons.face,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

              //lookingForInaPartner
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: lookingForInaPartnerTextEditingController,
                  labelText: "Describe Your Ideal Mate",
                  iconData: Icons.text_snippet_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

               //*** Appearance ***
              const Text("Physical Stats:",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                ),
              ),

              const SizedBox(
                height:8,
              ),

              //height section
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: heightTextEditingController,
                  labelText: "Height",
                  iconData: Icons.insert_chart,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

              //weight section
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: weightTextEditingController,
                  labelText: "Weight",
                  iconData: Icons.fastfood_sharp,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

              //body type section
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: bodyTypeTextEditingController,
                  labelText: "Body Type",
                  iconData: Icons.boy_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

              //*** Lifestyle ***
              const Text("Lifestyle:",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                ),
              ),

              const SizedBox(
                height:8,
              ),

              //drink section
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: drinkTextEditingController,
                  labelText: "Alcohol Consumption",
                  iconData: Icons.no_drinks_sharp,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

              //smoking section
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: bodyTypeTextEditingController,
                  labelText: "Body Type",
                  iconData: Icons.boy_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

              //marital status section
              SizedBox(
                width:MediaQuery.of(context).size.width-20,
                child: CustomTextFieldWidget(
                  editingController: bodyTypeTextEditingController,
                  labelText: "Body Type",
                  iconData: Icons.boy_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height:18,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
