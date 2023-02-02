// ignore_for_file: empty_catches

import 'dart:async';

import 'package:appfood/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AddinfoShop extends StatefulWidget {
  const AddinfoShop({super.key});

  @override
  State<AddinfoShop> createState() => _AddinfoShopState();
}

class _AddinfoShopState extends State<AddinfoShop> {
  late double mlat=0 , mlng = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findLatLng();
  }

  Future<Null> findLatLng() async {
    LocationData? locationData = await findLocationData();
    setState(() {
     // lat = locationData.latitude;
     // lng = locationData.longitude;
    });
    // mlat = locationData.latitude;
    // mlng = locationData.longitude;
    print('35 lat = $mlat, lng = $mlng');
  }

  Future<LocationData?> findLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

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
            MyStyle().mySizedBox(),
            mlat == null ? MyStyle().showProgress(): 
            showMap(),
            // AIzaSyCq2Bls6-ggkYorNRHfGv_7I08D9riww_I (API key)
            MyStyle().mySizedBox(),
            saveInformation()
          ],
        ),
      ),
    );
  }

  Widget saveInformation() {
    return Container( width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Save information'),
      ),
    );
  }

  Set<Marker> myMarker() {
    return <Marker> [
      Marker(
        markerId: MarkerId('myShop'),
        position: LatLng(mlat, mlng), 
        infoWindow: InfoWindow(
          title: 'ที่อยู่ ร้าน' ,
          snippet: 'mLat = $mlat, mLng = $mlng',
         ), 
      )
    ].toSet();
  }

  Container showMap() {
    LatLng mlatLng = LatLng(13.789582356948634, 100.56374053851904);
    CameraPosition mcameraPosition =
        CameraPosition(target: mlatLng, zoom: 16.0);
    return Container(
      height: 300.0,
      child: GoogleMap(
        initialCameraPosition: mcameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: myMarker(),
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
              Icons.add_photo_alternate,
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
