import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Login form'),
      ),
      body: PageForm(),
    );
  }
}

class PageForm extends StatefulWidget {
  @override
  _PageFormState createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {
  final double _minimumPadding = 5.0;

  var _genders = ['male', 'female', 'others'];
  String _genderVal = 'male';
  String _result = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            showImage('images/avatar.png'),
            Padding(
              padding: EdgeInsets.only(
                left: _minimumPadding * 2,
                right: _minimumPadding * 2,
              ),
              child: TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }

                  if (_validateEmail(value)) {
                    return 'The email is invalid';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(
              height: _minimumPadding * 4,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _minimumPadding * 2,
                right: _minimumPadding * 2,
              ),
              child: TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the password';
                  }
                  if (_validatePassword(value)) {
                    return 'required 1UCASE, 1lcase, 1 num, 1 special char (!@)';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_passwordVisible,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            SizedBox(
              height: _minimumPadding * 4,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _minimumPadding * 2,
                right: _minimumPadding * 2,
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                onChanged: (String genderValue) {
                  setState(() {
                    this._genderVal = genderValue;
                  });
                },
                value: _genderVal,
                items: _genders.map((String gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: _minimumPadding * 4,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _minimumPadding * 2,
                right: _minimumPadding * 2,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            this._result = _loginFunction();
                          });

                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text(_result)));
                        }
                      },
                      color: Theme.of(context).accentColor,
                      textColor: Theme.of(context).primaryColorDark,
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(_minimumPadding * 4),
                      child: Text(
                        'Login',
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
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(_minimumPadding * 4),
                      child: Text(
                        'Register',
                        textScaleFactor: 1.25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 4),
              child: Text(
                this._result,
                textScaleFactor: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? true : false;
  }

  bool _validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);

    return (!regex.hasMatch(value)) ? true : false;
  }

  Widget showImage(String imgPath) {
    AssetImage assetImage = AssetImage(imgPath);
    Image image = Image(
      image: assetImage,
      width: 100.0,
      height: 100.0,
    );

    return Container(
      child: image,
      padding: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  String _loginFunction() {
    String email = emailController.text;
    String password = passwordController.text;
    String result = 'email: $email, password: $password, gender: $_genderVal';

    return result;
  }
}
