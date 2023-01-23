import 'package:flutter/material.dart';

class menuList extends StatefulWidget {
  const menuList({super.key});

  @override
  State<menuList> createState() => _menuListState();
}

class _menuListState extends State<menuList> {
  @override
  Widget build(BuildContext context) {
    return Text('รายการเมนู/สินค้า');
  }
}
