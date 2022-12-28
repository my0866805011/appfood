import 'package:appfood/utility/my_style.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
      onPressed: () {}, 
      child: Text('Login',),
    ),
  );

 
Widget userForm() => Container(
    width: 250.0,
    child: TextField(
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
    child: TextField(obscureText: true,
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