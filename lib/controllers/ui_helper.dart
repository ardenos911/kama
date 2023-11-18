

import 'package:flutter/material.dart';
//import 'package:paypal_integration_app/helpers/navigation_service.dart';

class UIHelper {
   static showAlertDialog(String message, {title = ''}){
     showDialog(context: NavigationService.navigatorKey.currentContext!,
         builder: (BuildContext context) {
           return AlertDialog(
             title: Text(title),
             content: Text(message),
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(2.0))),
             actions: [
               ElevatedButton(onPressed: () {}, child: Text('OK')),
             ],
           );
           }
         );
     }


   }// end of UI helper class

