import 'package:flutter/material.dart';
import 'package:vr_app/Classes/strings.dart';
import 'package:vr_app/CustomWidgets/custom_card.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final formKey = GlobalKey<FormState>();

  String name;
  String email;
  String pass;
  
  _validate(){
    final form = formKey.currentState;
    form.save();
    // model.signUp(name, email, pass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.orange[400],
              Colors.blue[300],
              Colors.pink[200],
              Colors.redAccent[100],
            ],
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
          child: SingleChildScrollView(
            child: CustomCard(
              childView: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: Theme(
                      data: ThemeData(
                          brightness: Brightness.light,
                          primarySwatch: Colors.orange,
                          fontFamily: Strings.fontFamily,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: Colors.black, fontSize: 17.0))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              Strings.signup,
                              style: TextStyle(fontSize: 30.0),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            // User name
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: Strings.enterName),
                              validator: (val) {
                                if (val.length > 12 || val.isEmpty) {
                                  return Strings.errorInvalidemailID;
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (val) {
                                name=val;
                              },
                            ),
                            // Email ID
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: Strings.enterEmail),
                              validator: (val) {
                                if (val.length > 20 || val.isEmpty) {
                                  return Strings.errorInvalidemailID;
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (val) {
                                email=val;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                            // Password
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: Strings.enterPassword),
                              validator: (val) {
                                if (val.length > 12 || val.isEmpty) {
                                  return Strings.errorPasswordShort;
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (val) {
                                pass=val;
                              },
                              obscureText: true,
                            ),
                            // Repeat password
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: Strings.repeatPassword),
                              validator: (val) {
                                if (val.length > 12 || val.isEmpty) {
                                  return Strings.errRepeatPassword;
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (val) {},
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            MaterialButton(
                              height: 40.0,
                              minWidth: 200.0,
                              color: Colors.redAccent,
                              textColor: Colors.black,
                              child: Text(Strings.signup),
                              onPressed: () {
                                _validate();
                              },
                              splashColor: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 40, left: 5),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
