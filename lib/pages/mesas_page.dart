import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooka_tienda/Contenidos/banner_tienda.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa1.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa10.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa11.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa12.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa2.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa3.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa4.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa5.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa6.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa7.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa8.dart';
import 'package:hooka_tienda/Contenidos/cont_mesa9.dart';
import 'package:hooka_tienda/models/theme_preferences.dart';
import 'package:hooka_tienda/providers/theme.dart';
import 'package:provider/provider.dart';

class Rutas_de_las_mesas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'mesa1': (BuildContext context) => InterioMesa1(),
        'mesa2': (BuildContext context) => InterioMesa2(),
        'mesa3': (BuildContext context) => InterioMesa3(),
        'mesa4': (BuildContext context) => InterioMesa4(),
        'mesa5': (BuildContext context) => InterioMesa5(),
        'mesa6': (BuildContext context) => InterioMesa6(),
        'mesa7': (BuildContext context) => InterioMesa7(),
        'mesa8': (BuildContext context) => InterioMesa8(),
        'mesa9': (BuildContext context) => InterioMesa9(),
        'mesa10': (BuildContext context) => InterioMesa10(),
        'mesa11': (BuildContext context) => InterioMesa11(),
        'mesa12': (BuildContext context) => InterioMesa12(),
      },
    );
  }
}

class MesasPage extends StatefulWidget {
  @override
  _MesasPageState createState() => _MesasPageState();
}

class _MesasPageState extends State<MesasPage> {
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
              //done van las mesas
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
                              onTap: () {
                                Navigator.pushNamed(context, 'menu');
                              },
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
                              onTap: () {
                                Navigator.pushNamed(context, 'menu');
                              },
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
                              onTap: () {
                                Navigator.pushNamed(context, 'menu');
                              },
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
                      child: Scaffold(
                        backgroundColor: currentTheme.isDarkTheme()
                            ? Color(0xff2a293d)
                            : Colors.white,
                        appBar: AppBar(
                          title: Text('Selectable Tables'),
                          backgroundColor: currentTheme.isDarkTheme()
                              ? Colors.black12
                              : Colors.blue,
                        ),
                        body: Center(
                          child: Column(
                            children: <Widget>[
                              BannerTienda(),
                              mesas_seleccion(),
                            ],
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

class mesas_seleccion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: Colors.blueAccent,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 4 / 3,
                children: <Widget>[
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa1');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 1',
                  ),
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa2');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 2',
                  ),
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa3');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 3',
                  ),
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa4');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 4',
                  ),
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa5');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 5',
                  ),
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa6');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 6',
                  ),
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa7');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 7',
                  ),
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa8');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 8',
                  ),
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa9');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 9',
                  ),
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa10');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 10',
                  ),
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa11');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 11',
                  ),
                  Mesa(
                    child: IconButton(
                      icon: Icon(Icons.desktop_mac),
                      iconSize: 60,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'mesa12');
                      },
                      tooltip: 'Selectable Table',
                    ),
                    text: 'Table 12',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Mesa extends StatelessWidget {
  final Widget child;
  final String text;

  const Mesa({
    Key key,
    @required this.child,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // GestureDetector(
              //   child: ,
              // ),
              this.child,
              SizedBox(height: 10),
              Text(
                this.text,
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
