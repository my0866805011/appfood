import 'dart:convert';
import 'package:appfood/model/user_model.dart';
import 'package:appfood/utility/my_style.dart';
import 'package:appfood/utility/normal_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  String user ='';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: <Color>[Colors.white,MyStyle().primaryColor],
          center: Alignment(0, -0.5),
          radius: 1.0,
        ),),
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyStyle().showLogo(),
              MyStyle().mySizedBox(),
              MyStyle().showTitle('app Food'),
              MyStyle().mySizedBox(),
              userForm(),
              MyStyle().mySizedBox(),
              passwordForm(),
              MyStyle().mySizedBox(),
              loginButton()
            ],
          ),
        ),  

        ),
      ),

    );
  }

  Widget loginButton() => Container(width: 250.0,
    child: ElevatedButton(
      onPressed: () {
        if (user.isEmpty || password.isEmpty) {
          normalDialog(context, 'ข้อมูลไม่ถูกต้อง');
        }else {
          checkAuthen();
        }

      }, 
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white),),
    ),
  );

  Future<Null> checkAuthen()async{
    String url ='https://www.57ans.com/appfood/getUserWhereUser.php?isAdd=true&user=$user';
    try {
      Response response = await Dio().get(url);
       print('res = $response');

       var result = json.decode(response.data);
       print('result = $result ');
       for (var map in result) {
          UserModel userModel = UserModel.fromJson(map);
          if (password == userModel.password){

          }else {
            normalDialog(context,'Password ไม่ถูกต้อง');
          }
         
   
       }
       
    } catch (e) {
      
    }
  
  
  }
 
Widget userForm() => Container(
    width: 250.0,
    child: TextField(onChanged: (value) => user =value.trim(),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box,color: MyStyle().darkColor,),
        labelStyle: TextStyle(color: MyStyle().darkColor),
        labelText: 'User :',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyStyle().darkColor)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyStyle().darkColor)
        ),
      )
    ),
  );

  
Widget passwordForm() => Container(
    width: 250.0,
    child: TextField(onChanged: (value)=>password = value.trim(),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock,color: MyStyle().darkColor,),
        labelStyle: TextStyle(color: MyStyle().darkColor),
        labelText: 'Password :',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyStyle().darkColor)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyStyle().darkColor)
        ),
      )
    ),
  );

}