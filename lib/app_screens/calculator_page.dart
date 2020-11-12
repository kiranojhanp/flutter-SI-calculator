import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple interest calculator'),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

// TODO text validation

class _HomeBodyState extends State<HomeBody> {
  final double _minimumPadding = 5.0;

  var _formKey = GlobalKey<FormState>();

  var _currencies = ['Bhat', 'Rupees', 'Dollar', 'Pounds', 'Others'];
  String _currency = '';

  @override
  void initState() {
    super.initState();
    _currency = _currencies[1];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayText = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          // physics: ClampingScrollPhysics(),
          children: <Widget>[
            getImageAsset(),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: textStyle,
                controller: principalController,
                validator: (String val) {
                  if (val.isEmpty) {
                    return 'Enter the principal amount';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Principal',
                    labelStyle: textStyle,
                    hintText: 'Enter Principal eg: 12000',
                    errorStyle: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 15.0,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: textStyle,
                controller: roiController,
                validator: (String val) {
                  if (val.isEmpty) {
                    return 'Enter the rate of interest';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Rate of interest',
                    labelStyle: textStyle,
                    hintText: 'In percent',
                    errorStyle: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 15.0,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: termController,
                      validator: (String val) {
                        if (val.isEmpty) {
                          return 'Enter the years';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Term',
                          labelStyle: textStyle,
                          hintText: 'Time in years',
                          errorStyle: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 15.0,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                  ),
                  SizedBox(
                    width: _minimumPadding * 5,
                  ),
                  Expanded(
                    child: DropdownButton(
                      onChanged: (String newCurrencyVal) {
                        _setCurrencyType(newCurrencyVal);
                      },
                      value: _currency,
                      items: _currencies.map((String currVal) {
                        return DropdownMenuItem(
                          child: Text(currVal),
                          value: currVal,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
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
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text(
                        'Calculate',
                        textScaleFactor: 1.25,
                      ),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Reset',
                        textScaleFactor: 1.25,
                      ),
                    ),
                  ),
                ],
              ),
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
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money.png');

    Image image = Image(
      image: assetImage,
      height: 125.0,
      width: 125.0,
    );

    return Container(
      child: image,
      padding: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  String _calculateTotalReturn() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalAmountPayable $_currency';
    return result;
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';

    displayText = '';
    _currency = _currencies[1];
  }

  void _setCurrencyType(String newCurrencyVal) {
    setState(() {
      _currency = newCurrencyVal;
    });
  }
}
