import 'package:flutter/material.dart';

class AddinfoShop extends StatefulWidget {
  const AddinfoShop({super.key});

  @override
  State<AddinfoShop> createState() => _AddinfoShopState();
}

class _AddinfoShopState extends State<AddinfoShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Information Shop'),),
    );
  }
}