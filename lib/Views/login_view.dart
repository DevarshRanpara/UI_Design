import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vr_app/Classes/strings.dart';
import 'package:vr_app/CustomWidgets/custom_card.dart';
import 'package:vr_app/CustomWidgets/fancy_button.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:vr_app/Views/forget_pass.dart';
import 'package:vr_app/Views/signup_view.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.title,
      home: HomePage(),
      theme: ThemeData(
          fontFamily: Strings.fontFamily,
          primarySwatch: Colors.orange,
          brightness: Brightness.light,
          accentColor: Colors.orangeAccent),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  Widget lgForm;

  String _userId;
  String _password;

  bool showfab2=true;

  @override
  void initState() {
    _setBackForm();
    super.initState();
  }

  void _submit() async {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      _setLoading();
      //String res = await loginModel.auth(_userId, _password);
      _gotoHome('invalid');
    }
  }

  _setLoading() {
    showfab2=false;
    setState(() {
      lgForm = SizedBox(
        height: 200,
        width: 200,
        child: FlareActor(
          Strings.dropLoadFlr,
          animation: Strings.dropLoadFlrAnimtion,
        ),
      );
    });
  }

  _setBackForm() {
    showfab2=true;
    setState(() {
      lgForm = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 130.0,
            height: 130.0,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(Strings.rLogoTeal),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Theme(
              data: ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.orange,
                  fontFamily: Strings.fontFamily,
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle:
                          TextStyle(color: Colors.black, fontSize: 17.0))),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: Strings.enterEmailIdMsg),
                      validator: (val) {
                        if (val.length > 25 || val.isEmpty) {
                          return Strings.errorInvalidemailID;
                        } else {
                          return null;
                        }
                      },
                      onSaved: (val) => _userId = val,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: Strings.enterPasswordMsg),
                      validator: (val) =>
                          val.length < 8 ? Strings.errorPasswordShort : null,
                      onSaved: (val) => _password = val,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    Padding(padding: const EdgeInsets.only(top: 20.0)),
                    MaterialButton(
                      height: 40.0,
                      minWidth: 200.0,
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      child: Text(Strings.btnLogin),
                      onPressed: () {
                        _submit();
                      },
                      splashColor: Colors.red,
                    ),
                    SizedBox(height: 10.0,),
                    GestureDetector(
                      onTap: (){
                         Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ForgotPassView()));
                      },
                      child: Text('Forgot Password?'),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
    });
  }

  void _gotoHome(String role) {
    if (role == Strings.roleAdmin) {
      _setBackForm();
    } else if (role == Strings.roleBuilder) {
      _setBackForm();
    } else if (role == Strings.roleUser) {
      _setBackForm();
    } else {
      showSnakbar('Invalid');
      _setBackForm();
    }
//    if (role == Strings.roleUser) {
//      Navigator.pushReplacement(context,
//          MaterialPageRoute(builder: (BuildContext context) => UserMainPage()));
//    } else if (role == Strings.roleAdmin) {
//      Navigator.pushReplacement(
//          context,
//          MaterialPageRoute(
//              builder: (BuildContext context) => AdminHomeView()));
//    } else if (role == Strings.userBlocked) {
//      _setBackForm();
//      showSnakbar(Strings.userBlockMessage);
//    } else if (role == Strings.internetEr) {
//      _setBackForm();
//      showSnakbar(Strings.internetErrorMsg);
//    } else {
//      _setBackForm();
//      showSnakbar(Strings.invalidUserMessage);
//    }
  }

  void showSnakbar(String msg) {
    final snackbar = SnackBar(
      content: Text(msg),
      backgroundColor: Colors.red,
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      key: scaffoldKey,
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
              Colors.pink[100],
            ],
          ),
        ),
        child: Center(
            child: SingleChildScrollView(
                child: CustomCard(
          childView: lgForm,
        ))),
      ),
      floatingActionButton: showFab && showfab2
          ? FancyButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignUpView()));
              },
            )
          : null,
    );
  }
}
