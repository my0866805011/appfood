import 'package:appfood/utility/my_style.dart';
import 'package:appfood/utility/normal_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType = '';
  String name ='';
  String user ='';
  String password='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          myLogo(),
          MyStyle().mySizedBox(),
          showAppName(),
          MyStyle().mySizedBox(),
          nameForm(),
          MyStyle().mySizedBox(),
          userForm(),
          MyStyle().mySizedBox(),
          passwordForm(),
          MyStyle().mySizedBox(),
          userRadio(),
          shopRadio(),
          riderRadio(),
          MyStyle().mySizedBox(),
          registerButton(),
        ],
      ),
    );
  }

  Widget registerButton() => Container(width: 250.0,
    child: ElevatedButton(
      onPressed: () {
        print('Name = $name,User = $user,Password = $password , chooseType = $chooseType ');
        
       
        if (name.isEmpty ||
         user.isEmpty || 
         password.isEmpty ||
         chooseType.isEmpty) 
         {
          print('error');
          normalDialog(context, 'ข้อมูลไม่ครบถ้วน');
        }else {
         // normalDialog(context, 'register');
          registerThread();
        }
      }, 
      child: const Text('Register',),
    ),
  );

  Future<Null> registerThread()async{
    
    String url = 'https://www.57ans.com/appfood/insertuser.php?isAdd=true&name=$name&type=$chooseType&user=$user&password=$password';
      
    try {
       Response response = await Dio().get(url);
       print('res = $response');

      if (response.toString().trim() == 'true') {
        Navigator.pop(context);
        
      } else {
        normalDialog(context, 'Error ลองใหม่');
      }
      
    } catch (e) {
      
    }


  }

  Row userRadio() => Row(
    mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,  
            child: Row(
              children: <Widget> [
                Radio(value: 'User', 
                  groupValue: chooseType, 
                  onChanged: (value) {
                    setState(() {
                      chooseType = value!;
                    });
                  },
                ),
                Text('1.ผู้สั่งอาหาร',
                style: TextStyle(color: MyStyle().darkColor),
              ),
              ],
            ),
          ),
        ],
      );

    Row shopRadio() => Row(
     mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,  
            child: Row(
              children: <Widget> [
                Radio(value: 'Shop', 
                  groupValue: chooseType, 
                  onChanged: (value) {
                    setState(() {
                      chooseType = value!;
                    });
                  },
                ),
                Text('2.ร้านอาหาร',
                style: TextStyle(color: MyStyle().darkColor),
              ),
              ],
            ),
          ),
        ],
      );  

    Row riderRadio() => Row(
      mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,  
            child: Row(
              children: <Widget> [
                Radio(value: 'Rider', 
                  groupValue: chooseType, 
                  onChanged: (value) {
                    setState(() {
                      chooseType = value!;
                    });
                  },
                ),
                Text('3.ผู้ส่งอาหาร',
                style: TextStyle(color: MyStyle().darkColor),
              ),
              ],
            ),
          ),
        ],
      );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => name = value.trim(),
                decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.face,
                color: MyStyle().darkColor,
              ),
              labelStyle: TextStyle(color: MyStyle().darkColor),
              labelText: 'Name :',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor)),
            )),
          ),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => user = value.trim(),
                decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.account_box,
                color: MyStyle().darkColor,
              ),
              labelStyle: TextStyle(color: MyStyle().darkColor),
              labelText: 'User :',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor)),
            )),
          ),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => password = value.trim(),
                decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: MyStyle().darkColor,
              ),
              labelStyle: TextStyle(color: MyStyle().darkColor),
              labelText: 'Pasword :',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor)),
            )),
          ),
        ],
      );

  Row showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showTitle('App Food'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyStyle().showLogo(),
        ],
      );
}
