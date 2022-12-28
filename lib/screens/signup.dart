import 'package:appfood/utility/my_style.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: ListView (padding: EdgeInsets.all(30.0),
        children: <Widget> [
          myLogo(),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyStyle().showTitle('App Food'),
            ],
          ),
          ],
        ),
    );
  }

  Widget myLogo() => Row(mainAxisAlignment: MainAxisAlignment.center ,
    children: <Widget>[
      MyStyle().showLogo(),
    ],
  );
}
