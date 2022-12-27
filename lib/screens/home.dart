import 'package:appfood/screens/signin.dart';
import 'package:appfood/screens/signup.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key, required String title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: showDrawer(),

    );
  }

  Drawer showDrawer() => Drawer(
    child: ListView(
      children: <Widget>[
        showHeadDrawer(),
        signInMenu(),
        signOutMenu(),

      ],
    )

  );

  ListTile signInMenu() {
    return ListTile(
        leading: Icon(Icons.android),
        title: Text('Sign In'),
          onTap: () {
          Navigator.pop(context);
          MaterialPageRoute route = MaterialPageRoute(
            builder: (Value)=>SignIn());
            Navigator.push(context, route);
        } ,
      );
  }
 ListTile signOutMenu() {
    return ListTile(
        leading: Icon(Icons.android),
        title: Text('Sign Out'),
          onTap: () {
          Navigator.pop(context);
          MaterialPageRoute route = MaterialPageRoute(
            builder: (Value)=>SignUp());
            Navigator.push(context, route);
        } ,
      );
  }


  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
        accountName: Text('Gust'),
       accountEmail: Text('Please Login'));
  }
}