import 'package:appfood/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utility/signout_process.dart';

class MianUser extends StatefulWidget {
  const MianUser({super.key});

  @override
  State<MianUser> createState() => _MianUserState();
}

class _MianUserState extends State<MianUser> {

  String nameUser ='';

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    findUser();
    
  }

  Future<Null> findUser()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameUser = preferences.getString('name')!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unnecessary_string_interpolations
      appBar: AppBar(
        // ignore: unnecessary_string_interpolations
        title: Text('สวัสดี $nameUser'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.exit_to_app),
          onPressed: () =>signOutProcess(context))                
        ],
      ),
      drawer:showDrawer() ,
    );
  }

 Drawer showDrawer() => Drawer(
  child: ListView(
    children: <Widget>[
      showHead(),   
    ],
  ),
 );

UserAccountsDrawerHeader showHead(){
  return UserAccountsDrawerHeader(
    decoration: MyStyle().myBoxDecoration('user1.jpg'),
    currentAccountPicture: MyStyle().showLogo(),
    accountName: Text('User Login'), 
    accountEmail: Text('Login'),
    );
    
  }
}
