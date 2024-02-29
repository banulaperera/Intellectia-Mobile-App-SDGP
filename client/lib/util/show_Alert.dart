import 'package:client/main.dart';
import 'package:flutter/material.dart';


  showError(message){
  final snackBar = SnackBar(
    content: Text(message,style:TextStyle(color:Colors.white,fontSize:18),textAlign: TextAlign.center,),
    backgroundColor: Colors.red,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(vertical:10,horizontal:80),
    duration:Duration(seconds:1),
  );
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
}

showSuccess(message){
  final snackBar = SnackBar(
    content: Text(message,style:TextStyle(color:Colors.black,fontSize:18),textAlign: TextAlign.center,),
    backgroundColor: Colors.green,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(vertical:10,horizontal:80),
    duration:Duration(milliseconds:300),
  );
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
}