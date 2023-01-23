import 'package:appfood/utility/my_style.dart';
import 'package:flutter/material.dart';

class infoShop extends StatefulWidget {
  const infoShop({super.key});

  @override
  State<infoShop> createState() => _infoShopState();
}

class _infoShopState extends State<infoShop> {
  @override
  Widget build(BuildContext context) {
    return MyStyle().titleCenter(context,'No Data');
  }
}