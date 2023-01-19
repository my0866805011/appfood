import 'package:appfood/utility/my_style.dart';
import 'package:appfood/utility/signout_process.dart';
import 'package:flutter/material.dart';

class MainRider extends StatefulWidget {
  const MainRider({super.key});

  @override
  State<MainRider> createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Rider'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      drawer: showDrawer(),
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
    decoration: MyStyle().myBoxDecoration('rider.png'),
    currentAccountPicture: MyStyle().showLogo(),
    accountName: Text('Rider Login',style: TextStyle(color: MyStyle().darkColor),), 
    accountEmail: Text('Login'),
    );
    
  }

}