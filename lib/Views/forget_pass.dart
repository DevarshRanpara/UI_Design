import 'package:flutter/material.dart';
import 'package:vr_app/Classes/strings.dart';
import 'package:vr_app/CustomWidgets/custom_card.dart';

class ForgotPassView extends StatefulWidget {
  @override
  _ForgotPassViewState createState() => _ForgotPassViewState();
}

class _ForgotPassViewState extends State<ForgotPassView> {
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
                                  Strings.forgetPass,
                                  style: TextStyle(fontSize: 30.0),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                // Email ID
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: Strings.enterEmail),
                                  validator: (val) {
                                    if (val.length > 12 || val.isEmpty) {
                                      return Strings.errorInvalidemailID;
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {},
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                MaterialButton(
                                  height: 40.0,
                                  minWidth: 200.0,
                                  color: Colors.redAccent,
                                  textColor: Colors.black,
                                  child: Text(Strings.submit),
                                  onPressed: () {},
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
        ),
      ),
    );
  }
}
