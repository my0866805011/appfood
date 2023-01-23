import 'package:flutter/material.dart';

class MyStyle {

  Color darkColor = Colors.blue.shade900;
  Color primaryColor = Colors.green;

  SizedBox mySizedBox() => SizedBox(
    width: 8.0,
    height: 16.0,
  );
  
  Text showTitle(String title) => Text(
    title,
    style: TextStyle(
      fontSize: 24.0,
      color: Colors.blue.shade900,
      fontWeight: FontWeight.bold,
    ),
  );

  Container showLogo() {
    return Container(
     width: 120.0,
     child: Image.asset('assets/images/logo.png'),
    );
  } 

  BoxDecoration myBoxDecoration(String namePic){
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/$namePic'),fit:BoxFit.cover,
         ),
       );
}
Widget titleCenter(BuildContext context, String cstring ){
  return Center(
    child: Container(width: MediaQuery.of(context).size.width*0.5,
      child: Text(cstring,
       style: TextStyle(fontSize: 24.0,
       fontWeight: FontWeight.bold,),
   ),
    ),
  ); 
}

  MyStyle();
}