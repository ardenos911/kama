

import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class UIHelper {
   static showAlertDialog(String message, ctx , {title = ''}){

        OneContext().showDialog(builder: (ctx)
        {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.0))),
            actions: [
              ElevatedButton(onPressed: () {
                OneContext().pop();
              }, child: Text('OK')),
            ],
          );
        });
   }
}// end of UI helper class

