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
      homeMenu(),
      foodMenu(),
      informationMenu(),
      signOutMenu(),

    ],
  ),
 );

 ListTile homeMenu() => ListTile(
  leading: Icon(Icons.home),
  title: Text('รายการสั่งซื้อ'),
  subtitle: Text('รายการรอจัดส่ง'),
  onTap: () => Navigator.pop(context),
 );

ListTile foodMenu() => ListTile(
  leading: Icon(Icons.food_bank),
  title: Text('รายการสินค้า'),
  subtitle: Text('รายละเอียด'),
  onTap: () => Navigator.pop(context),
 );

ListTile informationMenu() => ListTile(
  leading: Icon(Icons.info),
  title: Text('รายละเอียดร้าน'),
  subtitle: Text('รายละเอียดติดต่อ'),
  onTap: () => Navigator.pop(context),
 );


ListTile signOutMenu() => ListTile(
  leading: Icon(Icons.exit_to_app),
  title: Text('Sign Out'),
  subtitle: Text('Home (หน้าแรก)'),
  onTap: () => signOutProcess(context),
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