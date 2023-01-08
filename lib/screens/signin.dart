import 'dart:convert';
import 'package:appfood/model/user_model.dart';
import 'package:appfood/screens/Mian_shop.dart';
import 'package:appfood/screens/main_rider.dart';
import 'package:appfood/screens/main_user.dart';
import 'package:appfood/utility/my_style.dart';
import 'package:appfood/utility/normal_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String id ='';
  String muser ='';
  String mpassword = '';
  String mtype = '';
  
  String mname ='';
  

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
        if (muser.isEmpty || mpassword.isEmpty) {
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
    String url ='https://www.57ans.com/appfood/getUserWhereUser.php?isAdd=true&user=$muser';
    try {
      Response response = await Dio().get(url);
       print('res = $response');

       var result = json.decode(response.data);
       print('result = $result ');
       for (var map in result) {
          UserModel userModel = UserModel.fromJson(map);
          if (mpassword == userModel.password){
            String? chooseType = userModel.type;
            // ignore: unused_local_variable
            String? id = userModel.id;
            if (chooseType == 'User') {
               routeTuService(MianUser(),userModel);          
             } else if (chooseType == 'Shop') {
                 routeTuService(MainShop(),userModel);
             } else if (chooseType == 'Rider') {
                 routeTuService(MainRider(),userModel);     
             } else {
               normalDialog(context,'Error');
             }
          }else {
            // ignore: use_build_context_synchronously
            normalDialog(context,'Password ไม่ถูกต้อง');
          }
         
   
       }
       
    // ignore: empty_catches
    } catch (e) {
      
    }
  
  
  } 
  Future<Null>  routeTuService(Widget myWidget, UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("id" ,userModel.id.toString());
    preferences.setString('type', userModel.type.toString());
    preferences.setString('name', userModel.name.toString());
     mtype = preferences.getString('type')!;
     mname = preferences.getString('name')!;
      print('name 124:$mname');
      print('126 type : $mtype');
    
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,);
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context, route, (route) => false);
  }
 
Widget userForm() => Container(
    width: 250.0,
    child: TextField(onChanged: (value) => muser =value.trim(),
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
    child: TextField(onChanged: (value)=>mpassword = value.trim(),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
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