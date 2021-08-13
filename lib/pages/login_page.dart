import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooka_tienda/providers/theme.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return Flexible(
      child: SafeArea(
        child: Scaffold(
          backgroundColor:
              currentTheme.isDarkTheme() ? Color(0xff2a293d) : Colors.white,
          body: Form(
            child: Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/images/logo-1.jpg'),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        child: Image.asset('assets/images/logo-1.jpg',
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
    final currentTheme = Provider.of<ThemeProvider>(context);
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          backgroundColor:
              currentTheme.isDarkTheme() ? Colors.black12 : Colors.blue,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.verified_user),
                hintText: 'User',
                labelText: 'Chosen User',
              ),
              onChanged: (value) {},
            ),
          ),
        );
      },
    );
  }

  Widget _passwordTextField() {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          backgroundColor:
              currentTheme.isDarkTheme() ? Colors.black12 : Colors.blue,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: 'Password',
                labelText: 'Password Chosen',
              ),
              onChanged: (value) {},
            ),
          ),
        );
      },
    );
  }

  Widget _bottonLogin() {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
            child: Scaffold(
              backgroundColor:
                  currentTheme.isDarkTheme() ? Colors.black12 : Colors.blue,
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 15.0,
            color: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, 'menu');
            });
      },
    );
  }
}
