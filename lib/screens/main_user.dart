import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MianUser extends StatefulWidget {
  const MianUser({super.key});

  @override
  State<MianUser> createState() => _MianUserState();
}

class _MianUserState extends State<MianUser> {

  String name ='';

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
      name = preferences.getString('name')!;
      print('name 27 :$name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unnecessary_string_interpolations
      appBar: AppBar(title: Text('$name'),),
    );
  }
}



