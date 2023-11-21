import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:kama_love/tabScreens/swipping_screen.dart';
import '../homeScreen/home_screen.dart';
import 'constants.dart';
import 'package:get/get.dart';




class PayPalPayment extends StatefulWidget {
  const PayPalPayment({super.key});

  @override
  State<PayPalPayment> createState() => _PayPalPaymentState();
}

class _PayPalPaymentState extends State<PayPalPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("One Time Payment-Lifetime Access",
              style:const TextStyle(
                  color:Colors.redAccent,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
              )),
        ),
        body: Center(
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
                          print("onSuccess: $params");
                          Get.snackbar("Payment Successfull 🖐️", "Success");
                          await Get.to(()=>const SwippingScreen());
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
              child: const Text("Make a One Time Payment",
              style:const TextStyle(
                color:Colors.blueAccent,
                fontSize: 19,
                fontWeight: FontWeight.bold
                )
              )
          ),
        )
    );
  }
  }


