import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooka_tienda/pages/menu_page.dart';

class Mesas_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MesasPage(),
    );
  }
}

class MesasPage extends StatefulWidget {
  @override
  _MesasPageState createState() => _MesasPageState();
}

class _MesasPageState extends State<MesasPage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Flexible(
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
                              Navigator.pushNamed(context, 'menu');
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
                              Navigator.pushNamed(context, 'menu');
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
                              Navigator.pushNamed(context, 'menu');
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
                      appBar: AppBar(
                        title: Text('Mesas Sleccionables'),
                      ),
                      body: Center(
                        child: Column(
                          children: <Widget>[
                            BannerTienda(),
                            mesas_seleccion(),
//                            BannerMesas(),
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
    );
  }
}

class mesas_seleccion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 1',
                ),
                Mesa(
                  child: IconButton(
                    icon: Icon(Icons.desktop_mac),
                    iconSize: 60,
                    color: Colors.white,
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 2',
                ),
                Mesa(
                  child: IconButton(
                    icon: Icon(Icons.desktop_mac),
                    iconSize: 60,
                    color: Colors.white,
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 3',
                ),
                Mesa(
                  child: IconButton(
                    icon: Icon(Icons.desktop_mac),
                    iconSize: 60,
                    color: Colors.white,
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 4',
                ),
                Mesa(
                  child: IconButton(
                    icon: Icon(Icons.desktop_mac),
                    iconSize: 60,
                    color: Colors.white,
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 5',
                ),
                Mesa(
                  child: IconButton(
                    icon: Icon(Icons.desktop_mac),
                    iconSize: 60,
                    color: Colors.white,
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 6',
                ),
                Mesa(
                  child: IconButton(
                    icon: Icon(Icons.desktop_mac),
                    iconSize: 60,
                    color: Colors.white,
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 7',
                ),
                Mesa(
                  child: IconButton(
                    icon: Icon(Icons.desktop_mac),
                    iconSize: 60,
                    color: Colors.white,
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 8',
                ),
                Mesa(
                  child: IconButton(
                    icon: Icon(Icons.desktop_mac),
                    iconSize: 60,
                    color: Colors.white,
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 9',
                ),
                Mesa(
                  child: IconButton(
                    icon: Icon(Icons.desktop_mac),
                    iconSize: 60,
                    color: Colors.white,
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 10',
                ),
                Mesa(
                  child: IconButton(
                    icon: Icon(Icons.desktop_mac),
                    iconSize: 60,
                    color: Colors.white,
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 11',
                ),
                Mesa(
                  child: IconButton(
                    icon: Icon(Icons.desktop_mac),
                    iconSize: 60,
                    color: Colors.white,
                    onPressed: () {},
                    tooltip: 'Mesa seleccionable',
                  ),
                  text: 'Mesa 12',
                ),
              ],
            ),
          ),
        ],
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
              // OutlineButton.icon(
              //   icon: Icon(Icons.desktop_mac),
              //   color: Colors.white,
              //   label: Text('Mesa 1'),
              //   onPressed: () {},
              //   shape: StadiumBorder(),
              //   highlightColor: Colors.green[100],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
