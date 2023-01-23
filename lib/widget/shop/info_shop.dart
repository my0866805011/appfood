import 'package:appfood/screens/shop/add_info_shop.dart';
import 'package:appfood/utility/my_style.dart';
import 'package:flutter/material.dart';

class infoShop extends StatefulWidget {
  const infoShop({super.key});

  @override
  State<infoShop> createState() => _infoShopState();
}

class _infoShopState extends State<infoShop> {
  void routeToAddInfo(){
    MaterialPageRoute materialPageRoute =MaterialPageRoute(
      builder: (context) =>AddinfoShop(),
      );
      Navigator.push(context, materialPageRoute );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyStyle().titleCenter(context,'No Data'),
        addEditButton(),
      ],
    );
  }

  Row addEditButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [
              Container(margin: EdgeInsets.only(right: 16.0, bottom: 16.0,),
                child: FloatingActionButton(child: Icon(Icons.edit),
                  onPressed: ()=>routeToAddInfo(),
                  ),
              ),
            ],
          ),
        ],
      );
  }
}