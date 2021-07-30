import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooka_tienda/models/theme_preferences.dart';
import 'package:hooka_tienda/providers/theme.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'contenido_page.dart';

void main() {
  runApp(Menu_Page());
}

class Menu_Page extends StatelessWidget {
  static const String ROUTE = "/menu";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(),
    );
  }
}

var bannerItems = [
  "Hooka",
  "Savorizante",
  "Nivel de la Nicotina",
  "Bebida",
  "Aperitivos"
];
var bannerImages = [
  "images/hookaima.jpg",
  "images/savorizanteima.jpg",
  "images/niveldenicotinaima.jpg",
  "images/bebidaisima.jpg",
  "images/aperitivosima.jpg"
];

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
                                  AssetImage('assets/images/logo-1.png'),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Tienda Hooka',
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
                                'Inicio',
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
                                'Mesas',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, 'productos');
                              },
                              leading: Icon(
                                Icons.store,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Productos',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, 'pedidos');
                              },
                              leading: Icon(
                                Icons.card_travel_outlined,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Pedido',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pushNamed(context, 'configuraciones');
                              },
                              leading: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              title: Text(
                                'Configuracion',
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
                                'Salir',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'Cambio del tema',
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
                            title: Text('Inicio'),
                            backgroundColor: currentTheme.isDarkTheme()
                                ? Colors.black12
                                : Colors.blue,
                          ),
                          body: Center(
                            child: Column(
                              children: <Widget>[
                                BannerTienda(),
                                BannerCentro(),
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

class BannerTienda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = new List<Widget>();

    for (int x = 0; x < bannerItems.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: Flexible(
          child: Container(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        )
                      ]),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  child: Image.asset(
                    bannerImages[x],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black])),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        bannerItems[x],
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                      Text(
                        "Mas del 40% de",
                        style: TextStyle(fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      banners.add(bannerView);
    }
    return Flexible(
      child: Container(
        width: screenWidth,
        height: screenWidth * 9 / 16,
        child: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: banners,
        ),
      ),
    );
  }
}
