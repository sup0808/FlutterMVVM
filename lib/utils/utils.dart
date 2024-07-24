import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

 static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 20,
        toastLength: Toast.LENGTH_LONG
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context){
   showFlushbar(context: context,
       flushbar: Flushbar(
         message: message,
         backgroundColor: Colors.red,
         title: "Happy",
         messageColor: Colors.blue,
         duration: Duration(seconds: 3),
       )..show(context)
   );
  }

  static showSnackBar(String message, BuildContext context){
   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }


}