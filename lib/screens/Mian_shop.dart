import 'package:appfood/utility/my_style.dart';
import 'package:flutter/material.dart';

import '../utility/signout_process.dart';

class MainShop extends StatefulWidget {
  const MainShop({super.key});

  @override
  State<MainShop> createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: unnecessary_string_interpolations
        title: Text('Main Shop'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app),
          onPressed: () =>signOutProcess(context) )
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
    decoration: MyStyle().myBoxDecoration('shop.jpg'),
    currentAccountPicture: MyStyle().showLogo(),
    accountName: Text('Shop Login',style: TextStyle(color: MyStyle().darkColor),), 
    accountEmail: Text('Login'),
    );
    
  }
}