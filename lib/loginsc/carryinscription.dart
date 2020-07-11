import 'package:barberclube/helper/changepage.dart';
import 'package:barberclube/loginsc/carrybarber.dart';
import 'package:flutter/material.dart';

class Carryinscription extends StatefulWidget {
  _Carryinsc createState() => _Carryinsc();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
enum SingingCharacter { barber, client }

class _Carryinsc extends State<Carryinscription> {
  GlobalKey _globalKey = GlobalKey<FormState>();
  TextEditingController _username = TextEditingController();
  TextEditingController _age = TextEditingController();
  SingingCharacter _character = SingingCharacter.barber;
  @override
  Widget build(BuildContext context) {
    Map map = ModalRoute.of(context).settings.arguments;

    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
            key: _globalKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _username,
                  decoration: InputDecoration(hintText: 'user name'),
                ),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  controller: _age,
                  decoration: InputDecoration(hintText: 'age'),
                ),
                ListTile(
                  title: const Text('Client'),
                  leading: Radio(
                    value: SingingCharacter.client,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Barber'),
                  leading: Radio(
                    value: SingingCharacter.barber,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    if (_character == SingingCharacter.barber) {
                      changewithargument(context, Carrybarber(), map);
                    } else {
                      changeremplacepage(context, Carrybarber());
                    }
                  },
                  child: Text('continue'),
                )
              ],
            )),
      ),
    ));
  }
}
