import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kama_love/tabScreens/user_details_screen.dart';
import '../controllers/profile-controller.dart';
import '../global.dart';
import './distance_calculator.dart';
import 'package:url_launcher/url_launcher.dart';

class SwippingScreen extends StatefulWidget
{
  const SwippingScreen({super.key});

  @override
  State<SwippingScreen> createState() => _SwippingScreenState();
}

class _SwippingScreenState extends State<SwippingScreen>
{
  ProfileController profileController = Get.put(ProfileController());
  String senderName = "";
  String miles="";


  startChattingInWhatsApp(String receiverPhoneNumber) async
  {
    var androidUrl = "whatsapp://send?phone=$receiverPhoneNumber&text=Hi, I found your profile on kama app and would like to chat with you 😊.";
    var iosUrl = "https://wa.me/$receiverPhoneNumber?text=${Uri.parse('Hi, I found your profile on kama app and would like to chat with you 😊.')}";

    try
    {
      if(Platform.isIOS)
      {
         await launchUrl((Uri.parse(iosUrl)));
      }
      else
      {
         await launchUrl((Uri.parse(androidUrl)));
      }
    }
    on Exception
    {
      showDialog(
          context: context,
          builder: (BuildContext context)
          {
            return AlertDialog(
              title: const Text("Whatsapp Not Found 🚫"),
              content: const Text("WhatsApp is not installed 😨. Please Install WhatsApp ✆ To Use Chat Feature"),
              actions: [
                TextButton(
                  onPressed: ()
                  {
                    Get.back();
                  },
                  child: const Text("Ok"),
                ),
              ],
            );
          }
      );
    }
  }


 //Filter by GEO-LOCATION & TRAITS---
  applyFilter()
  {
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState)
            {
              return AlertDialog(
                title: const Text(
                  "Matching Filter",
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    const Text("I am looking for a:"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DropdownButton<String>(
                        hint: const Text('Select gender'),
                        value: chosenGender,
                        underline: Container(),
                        items: [
                          'Male',
                          'Female',
                          'Nonbinary',
                          'ladyboy',
                          'Transgender',
                          'Gay',
                          'Lesbian',
                          'Bisexual',
                        ].map((value)
                        {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                        onChanged: ( String? value)
                        {
                          setState(() {
                            chosenGender = value;
                            //print(value);
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20,),

                    const Text("from the Country:"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DropdownButton<String>(
                        hint: const Text('Select country'),
                        value: chosenCountry,
                        underline: Container(),
                        items: [
                          'Afghanistan',
                          'Albania',
                          'Algeria',
                          'Andorra',
                          'Angola',
                          'Anguilla',
                          'Antigua and Barbuda',
                          'Argentina',
                          'Armenia',
                          'Aruba',
                          'Austria',
                          'Azerbaijan',
                          'Bahamas',
                          'Bahrain',
                          'Bangladesh',
                          'Barbados',
                          'Belarus',
                          'Belgium',
                          'Belize',
                          'Benin',
                          'Bermuda',
                          'Bhutan',
                          'Bolivia',
                          'Bosnia and Herzegovina',
                          'Botswana',
                          'Brazil',
                          'British Virgin Islands',
                          'Brunei',
                          'Bulgaria',
                          'Burkina Faso',
                          'Burundi',
                          'Cambodia',
                          'Cameroon',
                          'Canada',
                          'Cape Verde',
                          'Cayman Islands',
                          'Central African Republic',
                          'Chad',
                          'Chile',
                          'China',
                          'Colombia',
                          'Comoros',
                          'Costa Rica',
                          'Croatia',
                          'Cuba',
                          'Curaco (Netherlands)',
                          'Cyprus',
                          'Czech Republic',
                          'Côte dIvoire',
                          'Democratic Republic of the Congo',
                          'Denmark',
                          'Djibouti',
                          'Dominica',
                          'Dominican Republic',
                          'Ecuador',
                          'Egypt',
                          'El Salvador',
                          'Equatorial Guinea',
                          'Eritrea',
                          'Estonia',
                          'Ethiopia',
                          'Faeroe Islands',
                          'Falkland Islands',
                          'Fiji',
                          'Finland',
                          'France',
                          'French Polynesia',
                          'Gabon',
                          'Georgia',
                          'Germany',
                          'Ghana',
                          'Greece',
                          'Greenland',
                          'Grenada',
                          'Guatemala',
                          'Guinea',
                          'Guinea-Bissau',
                          'Guyana',
                          'Haiti',
                          'Honduras',
                          'Hong Kong',
                          'Hungary',
                          'Iceland',
                          'India',
                          'Indonesia',
                          'Iran',
                          'Iraq',
                          'Ireland',
                          'Israel',
                          'Italy',
                          'Jamaica',
                          'Japan',
                          'Jordan',
                          'Kazakhstan',
                          'Kenya',
                          'Kuwait',
                          'Kyrgyzstan',
                          'Laos',
                          'Latvia',
                          'Lebanon',
                          'Lesotho',
                          'Liberia',
                          'Libya',
                          'Liechtenstein',
                          'Lithuania',
                          'Luxembourg',
                          'Macedonia',
                          'Madagascar',
                          'Malawi',
                          'Malaysia',
                          'Maldives',
                          'Mali',
                          'Malta',
                          'Mauritania',
                          'Mauritius',
                          'Mexico',
                          'Moldova',
                          'Mongolia',
                          'Montenegro',
                          'Montserrat',
                          'Morocco',
                          'Mozambique',
                          'Myanmar',
                          'Namibia',
                          'Nauru',
                          'Nepal',
                          'Netherlands',
                          'New Caledonia',
                          'New Zealand',
                          'Nicaragua',
                          'Niger',
                          'Nigeria',
                          'North Korea',
                          'Norway',
                          'Oman',
                          'Pakistan',
                          'Palestine',
                          'Panama',
                          'Papua New Guinea',
                          'Paraguay',
                          'Peru',
                          'Philippines',
                          'Pitcairn Islands',
                          'Poland',
                          'Portugal',
                          'Puerto Rico',
                          'Qatar',
                          'Republic of Congo',
                          'Romania',
                          'Russian Federation',
                          'Rwanda',
                          'Saint-Kitts and Nevis',
                          'Saint Lucia',
                          'Saint Martin',
                          'Saint Vincent-and-the-Grenadines',
                          'Saudi Arabia',
                          'Senegal',
                          'Serbia',
                          'Seychelles',
                          'Sierra Leone',
                          'Singapore',
                          'Slovakia',
                          'Slovenia',
                          'Solomon Islands',
                          'Somalia',
                          'South Africa',
                          'South Korea',
                          'South Sudan',
                          'Spain',
                          'Sri Lanka',
                          'Sudan',
                          'Suriname',
                          'Swaziland',
                          'Sweden',
                          'Switzerland',
                          'Syria',
                          'São Tomé and Principe',
                          'Taiwan',
                          'Tajikistan',
                          'Tanzania',
                          'Thailand',
                          'The Gambia',
                          'Timor Leste',
                          'Togo',
                          'Tonga',
                          'Trinidad and Tobago',
                          'Tunisia',
                          'Turkey',
                          'Turkmenistan',
                          'Turks and Caicos Islands',
                          'Uganda',
                          'Ukraine',
                          'United Arab Emirates',
                          'United States',
                          'USA',
                          'Uruguay',
                          'Uzbekistan',
                          'Vanuatu',
                          'Venezuela',
                          'Vietnam',
                          'Western-Sahara',
                          'Yemen',
                          'Zambia',
                          'Zimbabwe',
                        ].map((value)
                        {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value)
                        {
                          setState(() {
                            chosenCountry = value;
                            //print(value);
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20,),

                    const Text("age is equal to or above:"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DropdownButton<String>(
                        hint: const Text('Select age'),
                        value: chosenAge,
                        underline: Container(),
                        items: [
                          '18',
                          '20',
                          '25',
                          '30',
                          '35',
                          '40',
                          '45',
                          '50',
                          '55',
                          '65',
                        ].map((value)
                        {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value)
                        {
                          setState(() {
                            chosenAge = value;
                            //print(value);
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20,),

                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async
                    {
                      //Get.back();

                      await profileController.getResults();
                    },
                    child: const Text("Start Filters"),
                  ),

                  ElevatedButton(
                    onPressed: ()
                    {
                      //Get.back();

                      setState(() {
                        chosenAge = null;
                        chosenCountry = null;
                        chosenGender = null;
                      });

                      profileController.getFilterReset();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: const Text("Clear Filters"),
                  ),
                ],
              );
            },
          );
        }
    );
  }

  readCurrentUserData() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserID)
        .get()
        .then((dataSnapshot)
    {
      setState(() {
        senderName = dataSnapshot.data()!["name"].toString();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()
      {
        return PageView.builder(
          itemCount: profileController.allUsersProfileList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index)
          {
            final eachProfileInfo = profileController.allUsersProfileList[index];

            return DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      eachProfileInfo.imageProfile.toString(),
                    ),
                    fit: BoxFit.cover,
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [

                    //filter by GEO-LOCATION & TRAITS icon button--------
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: IconButton(
                          onPressed: ()
                          {
                            applyFilter();
                            Get.snackbar("Please Note 🖐️", " ALL Filters Must Have A Selection!");
                          },
                          icon: const Icon(
                            Icons.filter_list,
                            size: 35,
                            color:Colors.red
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    //----------distance calculator button--------------
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async{
                           miles = await calculateDistance(currentUserID,eachProfileInfo.uid.toString());
                             //print(miles);
                             setState(() {
                               miles;
                             });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[1],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26)
                            ),
                          ),
                          child: const Text(
                            "click to see how far away I am 💞",
                            style:  TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                          height:4,
                        ),
                        ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26)
                            ),
                          ),
                          child: Text(
                            " I am: ${miles} miles away from you ",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),


                    //user data
                    GestureDetector(
                      onTap: ()
                      {
                        profileController.viewSentAndViewReceived(
                          eachProfileInfo.uid.toString(),
                          senderName,
                        );

                        //send user to profile person userDetailScreen
                        Get.to(UserDetailsScreen(
                          userID: eachProfileInfo.uid.toString(),
                        ));
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [

                            //name
                            Text(
                              eachProfileInfo.name.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                letterSpacing: 4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            //age - city
                            Text(
                              eachProfileInfo.age.toString() + " ◉ " + eachProfileInfo.city.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                letterSpacing: 4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(
                              height: 4,
                            ),

                            //profession and religion
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                ElevatedButton(
                                  onPressed: (){
                                    profileController.viewSentAndViewReceived(
                                      eachProfileInfo.uid.toString(),
                                      senderName,
                                    );

                                    Get.to(UserDetailsScreen(
                                    userID: eachProfileInfo.uid.toString(),
                                  ));
                                    },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                  ),
                                  child: Text(
                                    eachProfileInfo.profession.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 6,
                                ),

                                ElevatedButton(
                                  onPressed: (){
                                    profileController.viewSentAndViewReceived(
                                      eachProfileInfo.uid.toString(),
                                      senderName,
                                    );

                                    Get.to(UserDetailsScreen(
                                    userID: eachProfileInfo.uid.toString(),
                                  ));
                                    },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                  ),
                                  child: Text(
                                    eachProfileInfo.religion.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                              ],
                            ),

                            //country and ethnicity
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                ElevatedButton(
                                  onPressed: (){
                                    profileController.viewSentAndViewReceived(
                                      eachProfileInfo.uid.toString(),
                                      senderName,
                                    );

                                    Get.to(UserDetailsScreen(
                                    userID: eachProfileInfo.uid.toString(),
                                  ));
                                    },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                  ),
                                  child: Text(
                                    eachProfileInfo.country.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 6,
                                ),

                                ElevatedButton(
                                  onPressed: (){
                                    profileController.viewSentAndViewReceived(
                                      eachProfileInfo.uid.toString(),
                                      senderName,
                                    );

                                    Get.to(UserDetailsScreen(
                                    userID: eachProfileInfo.uid.toString(),
                                  ));
                                    },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16)
                                    ),
                                  ),
                                  child: Text(
                                    eachProfileInfo.ethnicity.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 14,
                    ),

                    //image buttons - favorite - chat - like
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        //favorite button
                        GestureDetector(
                          onTap: ()
                          {
                            profileController.favoriteSentAndFavoriteReceived(
                              eachProfileInfo.uid.toString(),
                              senderName,
                            );

                          },
                          child: Image.asset(
                            "images/favorite.png",
                            width: 60,
                          ),
                        ),

                        //chat button
                        GestureDetector(
                          onTap: ()
                          {

                            startChattingInWhatsApp(eachProfileInfo.phoneNo.toString());
                          },
                          child: Image.asset(
                            "images/chat.png",
                            width: 70,
                          ),
                        ),


                        //like button
                        GestureDetector(
                          onTap: ()
                          {
                            profileController.likeSentAndLikeReceived(
                              eachProfileInfo.uid.toString(),
                              senderName,
                            );
                          },
                          child: Image.asset(
                            "images/like.png",
                            width: 60,
                          ),
                        ),

                      ],
                    ),

                  ],
                ),

              ),
            );
          },
        );
      }),
    );
  }
}

