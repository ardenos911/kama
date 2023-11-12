import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kama_love/global.dart';
import 'package:kama_love/homeScreen/home_screen.dart';
import 'package:kama_love/widgets/custom_text_field_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



class AccountSettingsScreen extends StatefulWidget
{
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}



class _AccountSettingsScreenState extends State<AccountSettingsScreen>
{
  bool uploading = false, next = false;
  final List<File> _image = [];
  List<String> urlsList = [];
  double val = 0;

  //personal info
  TextEditingController genderTextEditingController = TextEditingController();
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

  //Life style
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController martialStatusTextEditingController = TextEditingController();
  TextEditingController haveChildrenTextEditingController = TextEditingController();
  TextEditingController noOfChildrenTextEditingController = TextEditingController();
  TextEditingController professionTextEditingController = TextEditingController();
  TextEditingController employmentStatusTextEditingController = TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController = TextEditingController();
  TextEditingController willingToRelocateTextEditingController = TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController = TextEditingController();

  //Background - Cultural Values
  TextEditingController nationalityTextEditingController = TextEditingController();
  TextEditingController educationTextEditingController = TextEditingController();
  TextEditingController languageSpokenTextEditingController = TextEditingController();
  TextEditingController religionTextEditingController = TextEditingController();
  TextEditingController ethnicityTextEditingController = TextEditingController();

  //personal info
  String name = '';
  String age = '';
  String gender = '';
  String phoneNo = '';
  String city = '';
  String country = '';
  String profileHeading = '';
  String lookingForInaPartner = '';

  //Appearance
  String height = '';
  String weight = '';
  String bodyType = '';

  //Life style
  String drink = '';
  String smoke = '';
  String martialStatus = '';
  String haveChildren = '';
  String noOfChildren = '';
  String profession = '';
  String employmentStatus = '';
  String income = '';
  String livingSituation = '';
  String willingToRelocate = '';
  String relationshipYouAreLookingFor = '';

  //Background - Cultural Values
  String nationality = '';
  String education = '';
  String languageSpoken = '';
  String religion = '';
  String ethnicity = '';


  chooseImage() async
  {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    
    setState(() {
      _image.add(File(pickedFile!.path));
    });
  }

  uploadImages() async
  {
    int i = 1;

    for(var img in _image)
    {
      setState(() {
        val = i / _image.length;
      });

      var refImages = FirebaseStorage.instance
          .ref()
          .child("images/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg");

      await refImages.putFile(img)
          .whenComplete(() async
      {
        await refImages.getDownloadURL()
            .then((urlImage)
        {
          urlsList.add(urlImage);

          i++;
        });
      });
    }
  }

  retrieveUserData() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get()
        .then((snapshot)
    {
      if(snapshot.exists)
      {//here you are setting the state variables with stored Firebase data
        setState(() {

          //personal info
          name = snapshot.data()!['name'];
          nameTextEditingController.text = name;
          age = snapshot.data()!['age'].toString();
          ageTextEditingController.text = age;
          gender = snapshot.data()!['gender'].toString();
          genderTextEditingController.text = gender;
          phoneNo = snapshot.data()!['phoneNo'];
          phoneNoTextEditingController.text = phoneNo;
          city = snapshot.data()!['city'];
          cityTextEditingController.text = city;
          country = snapshot.data()!['country'];
          countryTextEditingController.text = country;
          profileHeading = snapshot.data()!['profileHeading'];
          profileHeadingTextEditingController.text = profileHeading;
          lookingForInaPartner = snapshot.data()!['lookingForInaPartner'];
          lookingForInaPartnerTextEditingController.text = lookingForInaPartner;

          //Appearance
          height = snapshot.data()!['height'];
          heightTextEditingController.text = height;
          weight = snapshot.data()!['weight'];
          weightTextEditingController.text = weight;
          bodyType = snapshot.data()!['bodyType'];
          bodyTypeTextEditingController.text = bodyType;

          //Life style
          drink = snapshot.data()!['drink'];
          drinkTextEditingController.text = drink;
          smoke = snapshot.data()!['smoke'];
          smokeTextEditingController.text = smoke;
          martialStatus = snapshot.data()!['martialStatus'];
          martialStatusTextEditingController.text = martialStatus;
          haveChildren = snapshot.data()!['haveChildren'];
          haveChildrenTextEditingController.text = haveChildren;
          noOfChildren = snapshot.data()!['noOfChildren'];
          noOfChildrenTextEditingController.text = noOfChildren;
          profession = snapshot.data()!['profession'];
          professionTextEditingController.text = profession;
          employmentStatus = snapshot.data()!['employmentStatus'];
          employmentStatusTextEditingController.text = employmentStatus;
          income = snapshot.data()!['income'];
          incomeTextEditingController.text = income;
          livingSituation = snapshot.data()!['livingSituation'];
          livingSituationTextEditingController.text = livingSituation;
          willingToRelocate = snapshot.data()!['willingToRelocate'];
          willingToRelocateTextEditingController.text = willingToRelocate;
          relationshipYouAreLookingFor = snapshot.data()!['relationshipYouAreLookingFor'];
          relationshipYouAreLookingForTextEditingController.text = relationshipYouAreLookingFor;

          //Background - Cultural Values
          nationality = snapshot.data()!['nationality'];
          nationalityTextEditingController.text = nationality;
          education = snapshot.data()!['education'];
          educationTextEditingController.text = education;
          languageSpoken = snapshot.data()!['languageSpoken'];
          languageSpokenTextEditingController.text = languageSpoken;
          religion = snapshot.data()!['religion'];
          religionTextEditingController.text = religion;
          ethnicity = snapshot.data()!['ethnicity'];
          ethnicityTextEditingController.text = ethnicity;

        });
      }
    });
  }

  updateUserDataToFirestoreDatabase(
      //personal info
      String name, String age, String gender,
      String phoneNo, String city,
      String country, String profileHeading,
      String lookingForInaPartner,

      //Appearance
      String height, String weight, String bodyType,

      //Life style
      String drink, String smoke, String martialStatus,
      String haveChildren, String noOfChildren, String profession,
      String employmentStatus, String income, String livingSituation,
      String willingToRelocate, String relationshipYouAreLookingFor,

      //Background - Cultural Values
      String nationality, String education, String languageSpoken,
      String religion, String ethnicity,) async
  {
    showDialog(
        context: context,
        builder: (context)
        {
          return  AlertDialog(
            content: SizedBox(
              height: 200,
              child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text("⏳ uploading images..."),
                    ],
                  )
              ),
            ),
          );
        }
    );

    await uploadImages();

    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .update(
        {
          //personal info
          'name': name,
          'age': int.parse(age),
          "gender": gender.toLowerCase(),
          'phoneNo': phoneNo,
          'city': city.toLowerCase(),
          'country': country.toLowerCase(),
          'profileHeading': profileHeading,
          'lookingForInaPartner': lookingForInaPartner,

          //Appearance
          'height': height,
          'weight': weight,
          "bodyType": bodyType,

          //Life style
          'drink': drink,
          'smoke': smoke,
          'martialStatus': martialStatus,
          'haveChildren': haveChildren,
          'noOfChildren': noOfChildren,
          'profession': profession,
          'employmentStatus': employmentStatus,
          'income': income,
          'livingSituation': livingSituation,
          'willingToRelocate': willingToRelocate,
          'relationshipYouAreLookingFor': relationshipYouAreLookingFor,

          //Background - Cultural Values
          'nationality': nationality,
          'education': education,
          'languageSpoken': languageSpoken,
          'religion': religion,
          'ethnicity': ethnicity,

          //images
          'urlImage1': urlsList[0].toString(),
          'urlImage2': urlsList[1].toString(),
          'urlImage3': urlsList[2].toString(),
          'urlImage4': urlsList[3].toString(),
          'urlImage5': urlsList[4].toString(),
        });

    Get.snackbar("Updated", "your account has been updated successfully. ✔️");

    Get.to(HomeScreen());

    setState(() {
      uploading = false;
      _image.clear();
      urlsList.clear();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserData();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          next ? "Profile Information" : "Choose upto 5 Images 😎",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        actions: [
          next
          ? Container()
          : IconButton(
              onPressed: ()
              {
                if(_image.length == 5)
                {
                  setState(() {
                    uploading = true;
                    next = true;
                  });
                }
                else
                {
                  Get.snackbar("5 Images required! 🙄", "Please choose 5 images");
                }
              },
              icon: const Icon(Icons.navigate_next_outlined, size: 28,),
            ),
        ],
      ),
      body: next
      ?
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const SizedBox(
                height: 2,
              ),

              //personal info
              const Text(
                "Personal Info: 🎭",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //name
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nameTextEditingController,
                  labelText: "Name",
                  iconData: Icons.person_outline,
                  isObscure: false,
                ),
              ),


              const SizedBox(
                height: 24,
              ),

              //age
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ageTextEditingController,
                  labelText: "Age 👴",
                  iconData: Icons.numbers,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //gender
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: genderTextEditingController,
                  labelText: "Gender ♀️ ♂️",
                  iconData: Icons.person_outline_sharp,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //phoneNo
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: phoneNoTextEditingController,
                  labelText: "Phone 📱",
                  iconData: Icons.phone_android,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //city
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: cityTextEditingController,
                  labelText: "City 🌇",
                  iconData: Icons.location_city,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //country
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: countryTextEditingController,
                  labelText: "Country 🌄",
                  iconData: Icons.flag,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //profileHeading
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: profileHeadingTextEditingController,
                  labelText: "Profile Heading 👑",
                  iconData: Icons.text_fields,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //lookingForInaPartner
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: lookingForInaPartnerTextEditingController,
                  labelText: "Type of partner desired 👬",
                  iconData: Icons.face,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Appearance
              const Text(
                "Appearance: 🕴️",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //height
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: heightTextEditingController,
                  labelText: "Height ⛹️",
                  iconData: Icons.insert_chart,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //weight
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: weightTextEditingController,
                  labelText: "Weight 🍕",
                  iconData: Icons.fastfood_sharp,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //bodyType
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: bodyTypeTextEditingController,
                  labelText: "Body Type 🏋️",
                  iconData: Icons.girl,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Life style
              const Text(
                "Life style: 🏌️‍♀️",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //drink
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: drinkTextEditingController,
                  labelText: "Drink? 🍸",
                  iconData: Icons.no_drinks_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //smoke
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: smokeTextEditingController,
                  labelText: "Smoke 🚭",
                  iconData: Icons.smoking_rooms,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //martialStatus
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: martialStatusTextEditingController,
                  labelText: "Martial Status 💍",
                  iconData: CupertinoIcons.person_2,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //haveChildren
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: haveChildrenTextEditingController,
                  labelText: "Do you have Children? 👨‍👧‍👧",
                  iconData: CupertinoIcons.person_3_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //noOfChildren
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: noOfChildrenTextEditingController,
                  labelText: "Number of Children 🚼",
                  iconData: CupertinoIcons.cart_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),


              //profession
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: professionTextEditingController,
                  labelText: "Profession 👨‍💼",
                  iconData: Icons.business,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //employmentStatus
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: employmentStatusTextEditingController,
                  labelText: "Employment Status 👨‍💻",
                  iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //income
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: incomeTextEditingController,
                  labelText: "Income 💰",
                  iconData: CupertinoIcons.money_dollar_circle,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //livingSituation
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: livingSituationTextEditingController,
                  labelText: "Living Situation 🏚️",
                  iconData: CupertinoIcons.person_2_square_stack,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //willingToRelocate
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: willingToRelocateTextEditingController,
                  labelText: "Willing to Relocate? 🗽️",
                  iconData: CupertinoIcons.airplane,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //relationshipYouAreLookingFor
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: relationshipYouAreLookingForTextEditingController,
                  labelText: "Type of relationship desired? 👩‍❤️‍👨",
                  iconData: CupertinoIcons.person_alt_circle,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //Background - Cultural Values
              const Text(
                "Background - Cultural Values: 👳",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //nationality
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: nationalityTextEditingController,
                  labelText: "Nationality 🌎",
                  iconData: Icons.flag_circle_outlined,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //education
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: educationTextEditingController,
                  labelText: "Education 👨‍🎓",
                  iconData: Icons.history_edu,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //languageSpoken
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: languageSpokenTextEditingController,
                  labelText: "Language Spoken 🌐",
                  iconData: CupertinoIcons.chat_bubble_text,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //religion
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: religionTextEditingController,
                  labelText: "Religion 🧞‍♀️",
                  iconData: CupertinoIcons.plus,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 24,
              ),

              //ethnicity
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                  editingController: ethnicityTextEditingController,
                  labelText: "Ethnicity 🧕",
                  iconData: CupertinoIcons.globe,
                  isObscure: false,
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              //update account button
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 45,
                decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )
                ),
                child: InkWell(
                  onTap: () async
                  {
                    if(
                    //personal info
                    nameTextEditingController.text.trim().isNotEmpty
                        && ageTextEditingController.text.trim().isNotEmpty
                        && genderTextEditingController.text.trim().isNotEmpty
                        && phoneNoTextEditingController.text.trim().isNotEmpty
                        && cityTextEditingController.text.trim().isNotEmpty
                        && countryTextEditingController.text.trim().isNotEmpty
                        && profileHeadingTextEditingController.text.trim().isNotEmpty
                        && lookingForInaPartnerTextEditingController.text.trim().isNotEmpty &&

                        //Appearance
                        heightTextEditingController.text.trim().isNotEmpty
                        && weightTextEditingController.text.trim().isNotEmpty
                        && bodyTypeTextEditingController.text.trim().isNotEmpty &&

                        //Life style
                        drinkTextEditingController.text.trim().isNotEmpty
                        && smokeTextEditingController.text.trim().isNotEmpty
                        && martialStatusTextEditingController.text.trim().isNotEmpty
                        && haveChildrenTextEditingController.text.trim().isNotEmpty
                        && noOfChildrenTextEditingController.text.trim().isNotEmpty
                        && professionTextEditingController.text.trim().isNotEmpty
                        && employmentStatusTextEditingController.text.trim().isNotEmpty
                        && incomeTextEditingController.text.trim().isNotEmpty
                        && livingSituationTextEditingController.text.trim().isNotEmpty
                        && willingToRelocateTextEditingController.text.trim().isNotEmpty
                        && relationshipYouAreLookingForTextEditingController.text.trim().isNotEmpty &&

                        //Background - Cultural Values
                        nationalityTextEditingController.text.trim().isNotEmpty
                        && educationTextEditingController.text.trim().isNotEmpty
                        && languageSpokenTextEditingController.text.trim().isNotEmpty
                        && religionTextEditingController.text.trim().isNotEmpty
                        && ethnicityTextEditingController.text.trim().isNotEmpty)
                    {
                      _image.length > 0 ?
                      await updateUserDataToFirestoreDatabase(
                        //personal info
                        nameTextEditingController.text.trim(),
                        ageTextEditingController.text.trim(),
                        genderTextEditingController.text.trim(),
                        phoneNoTextEditingController.text.trim(),
                        cityTextEditingController.text.trim(),
                        countryTextEditingController.text.trim(),
                        profileHeadingTextEditingController.text.trim(),
                        lookingForInaPartnerTextEditingController.text.trim(),

                        //Appearance
                        heightTextEditingController.text.trim(),
                        weightTextEditingController.text.trim(),
                        bodyTypeTextEditingController.text.trim(),

                        //Life style
                        drinkTextEditingController.text.trim(),
                        smokeTextEditingController.text.trim(),
                        martialStatusTextEditingController.text.trim(),
                        haveChildrenTextEditingController.text.trim(),
                        noOfChildrenTextEditingController.text.trim(),
                        professionTextEditingController.text.trim(),
                        employmentStatusTextEditingController.text.trim(),
                        incomeTextEditingController.text.trim(),
                        livingSituationTextEditingController.text.trim(),
                        willingToRelocateTextEditingController.text.trim(),
                        relationshipYouAreLookingForTextEditingController.text.trim(),

                        //Background - Cultural Values
                        nationalityTextEditingController.text.trim(),
                        educationTextEditingController.text.trim(),
                        languageSpokenTextEditingController.text.trim(),
                        religionTextEditingController.text.trim(),
                        ethnicityTextEditingController.text.trim(),
                      ) : null;
                    }
                    else
                    {
                      Get.snackbar("A Field is Empty! ⛔", "Please fill out all text fields.");
                    }
                  },
                  child: const Center(
                    child: Text(
                      "Update",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 16,
              ),

            ],
          ),
        ),
      )
      :
      Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            child: GridView.builder(
              itemCount: _image.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index)
              {
                return index == 0
                ? Container(
                  color: Colors.white30,
                  child: Center(
                    child: IconButton(
                      onPressed: ()
                      {
                        if(_image.length < 5)
                        {  // if uploading is NOT true then chooseImage()
                          !uploading ? chooseImage() : null;
                        }
                        else
                        {
                          setState(() {
                            uploading == true;
                          });

                          Get.snackbar("5 Images Chosen 🎈", "5 Images Already Selected 👍");
                        }
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                )
                : Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(
                          _image[index - 1],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
