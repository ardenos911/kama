import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import '../homeScreen/home_screen.dart';
import 'constants.dart';
import 'package:get/get.dart';
import '../global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';




class PayPalPayment extends StatefulWidget {
  const PayPalPayment({super.key});

  @override
  State<PayPalPayment> createState() => _PayPalPaymentState();
}

class _PayPalPaymentState extends State<PayPalPayment> {

//sets a new field for the user regarding the payment status
  setPaidStatus()async {
    await FirebaseFirestore.instance.collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'hasPaid': hasPaid
    }, SetOptions(merge: true));
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white54, // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
            ),
            title:  const Text("One Time Payment \$99.98-Lifetime Access",
                style:TextStyle(
                    color:Colors.redAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                )),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/paypal.png'),
                  fit: BoxFit.fill),
            ),
            child: Center(
              child: TextButton(
                  onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => UsePaypal(
                            sandboxMode: true,
                            clientId:
                            "${Constants.clientId}",
                            secretKey:
                            "${Constants.secretKey}",
                            returnURL: "${Constants.returnURL}",
                            cancelURL: "${Constants.cancelURL}",
                            transactions: const [
                              {
                                "amount": {
                                  "total": '99.98',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '99.98',
                                    "shipping": '0.00',
                                    "shipping_discount": 0
                                  }
                                },
                                "description":
                                "The payment transaction description.",
                                // "payment_options": {
                                //   "allowed_payment_method":
                                //       "INSTANT_FUNDING_SOURCE"
                                // },
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "Kama-Premium Subscriber",
                                      "quantity": 1,
                                      "price": '99.98',
                                      "currency": "USD"
                                    }
                                  ],
                                }
                              }
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                              setState(() {
                                hasPaid=true;
                                setPaidStatus();
                              });
                              print(hasPaid);
                              print("onSuccess: $params");
                              Get.snackbar("Payment Successfull 🤑", "Success ✔️");
                              await Get.to(()=>const HomeScreen());
                            },
                            onError: (error) {
                              print("onError: $error");
                            },
                            onCancel: (params) {
                              print('cancelled: $params');
                            }),
                      ),
                    )
                  },
                  style:TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    elevation: 7,
                    padding: EdgeInsets.all(19.0),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Make a One Time Payment with PayPal",
                  style:const TextStyle(
                    color:Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    )
                  )
              ),
            ),
          )
      ),
    );
  }
  }

