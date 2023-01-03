import 'package:flutter/material.dart';

class MianUser extends StatefulWidget {
  const MianUser({super.key});

  @override
  State<MianUser> createState() => _MianUserState();
}

class _MianUserState extends State<MianUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main User'),),
    );
  }
}

