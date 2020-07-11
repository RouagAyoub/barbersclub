import 'package:barberclube/helper/changepage.dart';
import 'package:barberclube/loginsc/carryinscription.dart';
import 'package:barberclube/toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Auth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  String verificationId;
  TextEditingController _codecontroler = TextEditingController();

  Future<void> testnumber(BuildContext context, String number) async {
    final PhoneVerificationCompleted _verificationCompleted =
        (AuthCredential credential) async {
      //AuthResult result = await _auth.signInWithCredential(credential);
      if (credential != null) {
        changewithargument(context, Carryinscription(),
            {'credential': credential, '_auth': _auth});
      }
    };

    final PhoneVerificationFailed _verificationFailed =
        (AuthException authException) {
      showToast(authException.message.toString(), Colors.red);
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmation Code'),
            content: Container(
              height: 85,
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'check your sms'),
                    controller: _codecontroler,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.blue,
                onPressed: () async {
                  final code = _codecontroler.text.trim();
                  AuthCredential credential = PhoneAuthProvider.getCredential(
                      verificationId: verificationId, smsCode: code);
                  //AuthResult authResult = await _auth.signInWithCredential(credential);
                  if (credential != null) {
                    changewithargument(context, Carryinscription(),
                        {'credential': credential, '_auth': _auth});
                  } else {
                    showToast('wrong code try again', Colors.red);
                  }
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_alarm,
                      color: Colors.deepOrange,
                    ),
                    Text('valid')
                  ],
                ),
              ),
            ],
          );
        },
      );
    };

    final PhoneCodeAutoRetrievalTimeout _codeAutoRetrievalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
    };

    try {
      _auth.verifyPhoneNumber(
          phoneNumber: number.trim(),
          timeout: const Duration(seconds: 5),
          verificationCompleted: _verificationCompleted,
          verificationFailed: _verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
    } catch (e) {
      showToast(e.code, Colors.red);
    }
  }
}
