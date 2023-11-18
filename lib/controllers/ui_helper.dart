

import 'package:flutter/material.dart';
//import 'navigation_service.dart';

class UIHelper {
   static showAlertDialog(String message, ctx , {title = ''}){
     showDialog(context: ctx,
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

