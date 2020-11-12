import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nameCity = "";
  var _currencies = ['Rupees', 'Dollar', 'Pounds', 'Others'];
  String _currency = 'Rupees';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
      child: Column(
        children: <Widget>[
          TextField(
            onSubmitted: (String string) {
              setState(() {
                nameCity = string;
              });
            },
          ),
          Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Your favorite city is $nameCity',
                style: TextStyle(fontSize: 20.0),
              )),
          DropdownButton<String>(
            onChanged: (String newCurrency) {
              _dropDownItemSelected(newCurrency);
            },
            value: this._currency,
            items: _currencies.map((String currentCurrency) {
              return DropdownMenuItem(
                value: currentCurrency,
                child: Text(currentCurrency),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  void _dropDownItemSelected(String newCurrency) {
    setState(() {
      this._currency = newCurrency;
    });
  }
}
