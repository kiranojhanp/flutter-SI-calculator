import 'package:flutter/material.dart';
// import './app_screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exploring UI widgets',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic List view'),
        ),
        body: getLongListView(),
      ),
    ),
  );
}

List<String> getListElements() {
  var items = List<String>.generate(100, (counter) => "Item $counter");
  return items;
}

Widget getLongListView() {
  var listItemData = getListElements();

  var listViewLong = ListView.builder(
    itemCount: listItemData.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.arrow_right),
        title: Text(listItemData[index]),
        trailing: Icon(Icons.favorite_border),
      );
    },
  );

  return listViewLong;
}

Widget longList() {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  var longList = ListView.builder(
    padding: EdgeInsets.all(8),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        color: Colors.amber[colorCodes[index]],
        child: Center(
          child: Text('Entry ${entries[index]}'),
        ),
      );
    },
  );

  return longList;
}

Widget generateListView() {
  var listView = ListView(
    padding: EdgeInsets.all(8.0),
    children: <Widget>[
      Container(
        height: 50,
        color: Colors.amber[600],
        child: const Center(child: Text('Entry A')),
      ),
      Container(
        height: 50,
        color: Colors.amber[500],
        child: const Center(child: Text('Entry B')),
      ),
      Container(
        height: 50,
        color: Colors.amber[100],
        child: const Center(child: Text('Entry C')),
      ),
    ],
  );

  return listView;
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
