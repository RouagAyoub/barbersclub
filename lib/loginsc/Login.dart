import 'package:barberclube/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class Login extends StatefulWidget {
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController _phoneno = TextEditingController();
  Country _selected = Country.DZ;

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    CountryPicker(
                      dense: false,
                      showFlag: true,
                      showDialingCode: true,
                      showName: false,
                      showCurrency: false,
                      showCurrencyISO: false,
                      onChanged: (Country country) {
                        setState(() {
                          _selected = country;
                        });
                      },
                      selectedCountry: _selected,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _phoneno,
                        decoration: InputDecoration(hintText: 'phone number'),
                        validator: (value) {
                          if (value.length < 4 || value.length > 14) {
                            return 'number not valid';
                          } else if (value.startsWith('0')) {
                            _phoneno.text = value.replaceFirst('0', '');
                          }
                        },
                      ),
                    ),
                  ]),
                  FlatButton(
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        String _phone =
                            '+' + _selected.dialingCode + _phoneno.text;
                        Auth().testnumber(context, _phone);
                      }
                    },
                    child: Text('SignIn'),
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
