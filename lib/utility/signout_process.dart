import 'package:appfood/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<Null> signOutProcess(BuildContext context) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear() ;

    MaterialPageRoute route = MaterialPageRoute(
      // ignore: prefer_const_constructors
      builder: (context) => Home(title: '',),
      );
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(context, route,
    (route) => false) ;
   
    //exit(0);
  }