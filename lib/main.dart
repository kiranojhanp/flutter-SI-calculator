import 'package:flutter/material.dart';
// import './app_screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exploring UI widgets',
      home: HomePage1(),
    );
  }
}

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic List view'),
      ),
      body: getLongListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          alertPopup(context);
        },
        child: Icon(Icons.add),
        tooltip: 'Add One More Item',
      ),
    );
  }
}

void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text('You just tapped $item'),
    action: SnackBarAction(
      label: 'UNDO',
      onPressed: () {
        debugPrint('Doing undo');
      },
    ),
    duration: Duration(milliseconds: 1000),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}

List<String> getListElements() {
  var items = List<String>.generate(20, (counter) => "Item $counter");
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
        onTap: () {
          showSnackBar(context, listItemData[index]);
        },
      );
    },
  );

  return listViewLong;
}

void alertPopup(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text('Hello Kiran'),
    content: Text('Have a pleasent day'),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) => alertDialog,
  );
}
