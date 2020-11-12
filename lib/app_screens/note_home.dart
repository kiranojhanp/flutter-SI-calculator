import 'package:flutter/material.dart';
import '../app_screens/note_form.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add a note',
        onPressed: () {
          _navigateToForm(context, 'Add note');
        },
      ),
    );
  }
}

class ListBody extends StatefulWidget {
  @override
  _ListBodyState createState() => _ListBodyState();
}

class _ListBodyState extends State<ListBody> {
  final litems = List<String>.generate(30, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Container(
      child: listTask(),
    );
  }

  Widget listTask() {
    return ListView.builder(
      itemCount: litems.length,
      itemBuilder: (context, int index) {
        return ListTile(
          title: Text('${litems[index]}'),
          subtitle: Text('${litems[index]}'),
          leading: Icon(Icons.person),
          trailing: Icon(Icons.delete_outline),
          onTap: () {
            _navigateToForm(context, 'Edit note ');
          },
        );
      },
    );
  }
}

void _navigateToForm(BuildContext context, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return FormBody(title);
      },
    ),
  );
}
