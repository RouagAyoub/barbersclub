import 'package:barberclube/helper/changepage.dart';
import 'package:barberclube/loginsc/Login.dart';
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/dokhol.png'), fit: BoxFit.fill)),
      ),
      Positioned(
          right: 100,
          left: 100,
          bottom: MediaQuery.of(context).size.height / 6,
          child: GestureDetector(
            onTap: () {
              changeremplacepage(context, Login());
            },
            child: Image(
              image: AssetImage('images/dokholbutton.png'),
              fit: BoxFit.contain,
              height: 100,
            ),
          ))
    ]));
  }
}
