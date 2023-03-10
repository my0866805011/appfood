import 'package:flutter/material.dart';

 Future<void> normalDialog(
  BuildContext context,String message)async{
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(message),
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () =>  Navigator.pop(context),
              child: const Text('Ok',
              style: TextStyle(color: Colors.red),
            )),
          ],
        ),
      ],
    ),
  );
 }