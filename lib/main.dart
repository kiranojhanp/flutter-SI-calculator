import 'package:flutter/material.dart';
import './app_screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exploring UI widgets',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic List view'),
        ),
        body: getListView(),
      ),
    ),
  );
}

Widget getListView() {
  var listview = ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautiful view'),
        trailing: Icon(Icons.wb_sunny),
        onTap: () {
          debugPrint('Landscape tapped hehe');
        },
      ),
      ListTile(
        leading: Icon(Icons.laptop_mac),
        title: Text('Mac'),
      ),
      ListTile(
        leading: Icon(Icons.phone_android),
        title: Text('Phone'),
      ),
      Text('Yet another text element'),
      Container(
        color: Colors.red,
        height: 50.0,
      ),
    ],
  );

  return listview;
}
