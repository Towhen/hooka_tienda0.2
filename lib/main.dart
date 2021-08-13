import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooka_tienda/models/theme_preferences.dart';
import 'package:hooka_tienda/pages/login_page.dart';
import 'package:hooka_tienda/pages/mesas_page.dart';
import 'package:hooka_tienda/pages/splash_screen_state.dart';
import 'package:hooka_tienda/providers/theme.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'Contenidos/banner_centro.dart';
import 'Contenidos/banner_tienda.dart';

void main() {
  runApp(SplashScreen());
}

class Menu_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        'menu': (BuildContext context) => MenuPage(),
        'home': (BuildContext context) => SplashScreen(),
        'login': (BuildContext context) => LoginPage(),
        'mesas': (BuildContext context) => MesasPage(),
      },
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  ThemeProvider themeChangeProvider = new ThemeProvider();
  double value = 0;

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return ChangeNotifierProvider.value(
      value: themeChangeProvider,
      child: Flexible(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              //donde van las mesas
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue[400],
                      Colors.blue[800],
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              //menu de navegacion
              SafeArea(
                child: Container(
                  width: 200.0,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      DrawerHeader(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  AssetImage('assets/images/logo-1.jpg'),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Hooka Store',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, 'menu');
                              },
                              leading: Icon(
                                Icons.home,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Home',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, 'mesas');
                              },
                              leading: Icon(
                                Icons.table_view,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Tables',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              leading: Icon(
                                Icons.store,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Products',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              leading: Icon(
                                Icons.card_travel_outlined,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Order',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              leading: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Setting',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              leading: Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Go out',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Change theme',
                              style: TextStyle(
                                color: currentTheme.isDarkTheme()
                                    ? Colors.black12
                                    : Colors.blue,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.wb_sunny,
                                  color: currentTheme.isDarkTheme()
                                      ? Color(0xff2a293d)
                                      : Colors.white,
                                ),
                                Switch(
                                  value: currentTheme.isDarkTheme(),
                                  onChanged: (value) {
                                    String newTheme = value
                                        ? ThemePreference.DARK
                                        : ThemePreference.DARK;
                                    currentTheme.setTheme = newTheme;
                                  },
                                ),
                                Icon(
                                  Icons.brightness_2,
                                  color: currentTheme.isDarkTheme()
                                      ? Color(0xff2a293d)
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: value),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  builder: (_, double val, __) {
                    return (Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..setEntry(0, 3, 200 * val)
                        ..rotateY((pi / 6) * val),
                      child: Flexible(
                        child: Scaffold(
                          backgroundColor: currentTheme.isDarkTheme()
                              ? Color(0xff2a293d)
                              : Colors.white,
                          appBar: AppBar(
                            title: Text('Home'),
                            backgroundColor: currentTheme.isDarkTheme()
                                ? Colors.black12
                                : Colors.blue,
                          ),
                          body: Center(
                            child: Column(
                              children: <Widget>[
                                BannerTienda(),
                                //BannerCentro(),
                                BannerCentro2(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
                  }),
              GestureDetector(
                onHorizontalDragUpdate: (e) {
                  if (e.delta.dx > 0) {
                    setState(() {
                      value = 1;
                    });
                  } else {
                    setState(() {
                      value = 0;
                    });
                  }
                },
                //onTap: () {
                //setState(() {
                //value == 0 ? value = 1 : value = 0;
                //});
                //},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
