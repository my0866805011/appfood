import 'package:appfood/utility/my_style.dart';
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
      appBar: AppBar(
        title: const Text('Add Information Shop'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyStyle().mySizedBox(),
            nameForm(),
            MyStyle().mySizedBox(),
            addressForm(),
            MyStyle().mySizedBox(),
            phoneForm(),
            MyStyle().mySizedBox(),
            newImage(),
          ],
        ),
      ),
    );
  }

  Row newImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_a_photo,
              size: 36.0,
            )),
        Container(
          width: 250.0,
          child: Image.asset('assets/images/shop.png'),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_a_photo,
              size: 36.0,
            ))
      ],
    );
  }

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'ชื่อร้านค้า',
                prefixIcon: Icon(Icons.account_box),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

  Widget addressForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'ที่อยู่',
                prefixIcon: Icon(Icons.home),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

  Widget phoneForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'โทรติดต่อ',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );
}
