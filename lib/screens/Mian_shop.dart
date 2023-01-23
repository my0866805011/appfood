import 'package:appfood/utility/my_style.dart';
import 'package:appfood/widget/shop/info_shop.dart';
import 'package:appfood/widget/shop/menu_list.dart';
import 'package:appfood/widget/shop/order_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utility/signout_process.dart';

class MainShop extends StatefulWidget {
  const MainShop({super.key});

  @override
  State<MainShop> createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {


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


   Widget currentWidget = OrderListShop();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: unnecessary_string_interpolations
        
        title: Text('Main Shop $nameUser'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app),
          onPressed: () =>signOutProcess(context) )
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,

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
  onTap: () {
    setState(() {
      currentWidget = OrderListShop();
    });
    Navigator.pop(context);
  },
 );

ListTile foodMenu() => ListTile(
  leading: Icon(Icons.food_bank),
  title: Text('รายการสินค้า'),
  subtitle: Text('รายละเอียด'),
  onTap: () {
    setState(() {
      currentWidget=menuList();
    });
    Navigator.pop(context);
  },
 );

ListTile informationMenu() => ListTile(
  leading: Icon(Icons.info),
  title: Text('รายละเอียดร้าน'),
  subtitle: Text('รายละเอียดติดต่อ'),
  onTap: () {
    setState(() {
      currentWidget = infoShop();
    });
    Navigator.pop(context);
  },
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
    accountEmail: const Text('Login'),
    );
    
  }
}