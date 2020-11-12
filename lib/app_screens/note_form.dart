import 'package:flutter/material.dart';

class FormBody extends StatefulWidget {
  final String appBarTitle;
  FormBody(this.appBarTitle);

  @override
  _FormBodyState createState() => _FormBodyState(this.appBarTitle);
}

class _FormBodyState extends State<FormBody> {
  final double _minimumPadding = 6.0;

  var _formKey = GlobalKey<FormState>();

  var _impLevel = ['High', 'Medium', 'Low'];
  String _imp = '';

  String appBarTitle;
  _FormBodyState(this.appBarTitle);

  @override
  void initState() {
    super.initState();
    _imp = _impLevel[0];
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayText = '';
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;

    return WillPopScope(
      onWillPop: () {
        _goBack();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _goBack();
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(_minimumPadding * 4),
            child: ListView(
              // physics: ClampingScrollPhysics(),
              children: <Widget>[
                DropdownButton(
                  isExpanded: true,
                  onChanged: (String newCurrencyVal) {
                    _setImportance(newCurrencyVal);
                  },
                  value: _imp,
                  items: _impLevel.map((String currVal) {
                    return DropdownMenuItem(
                      child: Text(currVal),
                      value: currVal,
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: _minimumPadding * 4,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: titleController,
                  validator: (String val) {
                    if (val.isEmpty) {
                      return 'Enter the title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: textStyle,
                      hintText: 'Enter the title',
                      errorStyle: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                SizedBox(
                  height: _minimumPadding * 4,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: descController,
                  validator: (String val) {
                    if (val.isEmpty) {
                      return 'Enter the Description';
                    }
                    return null;
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      hintText: 'Enter the Description',
                      errorStyle: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                SizedBox(
                  height: _minimumPadding * 4,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              this.displayText = _calculateTotalReturn();
                            }
                          });
                        },
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorLight,
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Save',
                          textScaleFactor: 1.25,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _minimumPadding * 2,
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {},
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.25,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _minimumPadding * 2,
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            _reset();
                          });
                        },
                        color: Theme.of(context).secondaryHeaderColor,
                        textColor: Theme.of(context).primaryColorLight,
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Clear',
                          textScaleFactor: 1.25,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: Text(
                      this.displayText,
                      textScaleFactor: 1.5,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _calculateTotalReturn() {
    String _title = titleController.text;
    String _description = descController.text;

    return '$_title and $_description and $_imp';
  }

  void _reset() {
    titleController.text = '';
    descController.text = '';
    termController.text = '';

    displayText = '';
    _imp = _impLevel[0];
  }

  void _setImportance(String newImp) {
    setState(() {
      _imp = newImp;
    });
  }

  void _goBack() {
    Navigator.pop(context);
  }
}
