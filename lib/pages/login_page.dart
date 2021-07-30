import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooka_tienda/pages/menu_page.dart';

class LoginPage extends StatefulWidget {
  static const String ROUTE = "/";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SafeArea(
        child: Scaffold(
          body: Form(
            child: Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/images/logo-1.png'),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        child: Image.asset('assets/images/logo-1.png',
                            height: 400.0)),
                    SizedBox(
                      height: 15.0,
                    ),
                    _userTextField(),
                    SizedBox(
                      height: 15.0,
                    ),
                    _passwordTextField(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _bottonLogin(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.verified_user),
              hintText: 'Usuario',
              labelText: 'Usuario elegido',
            ),
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _passwordTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Contraseña',
              labelText: 'Contraseña elegido',
            ),
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _bottonLogin() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text(
                'Iniciar Sesion',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 15.0,
            color: Colors.blue,
            onPressed: () {
              MenuPage();
              Navigator.pop(context);
            });
      },
    );
  }
}
