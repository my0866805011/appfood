import 'package:appfood/screens/Mian_shop.dart';
import 'package:appfood/screens/main_rider.dart';
import 'package:appfood/screens/signin.dart';
import 'package:appfood/screens/signup.dart';
import 'package:appfood/screens/main_user.dart';
import 'package:appfood/utility/my_style.dart';
import 'package:appfood/utility/normal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key, required String title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String chooseType = '';
  String preferences = '';
  String nameUser = '';
  
  
  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPreferance();

  }

Future<Null> checkPreferance()async{
   try{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    nameUser = preferences.getString('name')!;
    chooseType = preferences.getString('type')!;

    //setState(() {
    //  nameUser = preferences.getString('name')!;
    //  chooseType = preferences.getString('type')!;
    //  
    //});
    if (chooseType !=null) {
        if (chooseType == 'User') {
          routeToService(MianUser());  
        } else if (chooseType == 'Shop'){
          routeToService(MainShop());
        } else if (chooseType == 'Rider') {
          routeToService(MainRider());
        } else {
          routeToService(MainRider());
          normalDialog(context, 'Error :$chooseType');  
        }
    }
    print('54 ChooseType : $chooseType');
    print('55 nameUser : $nameUser');


  }catch (e) {
  }
}

void routeToService(Widget myWidget) {
  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => myWidget,);
  Navigator.pushAndRemoveUntil(
    context, route, (route) => false);  
}
  
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
      decoration: MyStyle().myBoxDecoration('guest.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Gust'),
      accountEmail: Text('Please Login'));
  }
}