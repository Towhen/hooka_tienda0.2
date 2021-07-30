import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooka_tienda/pages/menu_page.dart';

class Mesas_Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MesasPage(),
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
                            BannerMesas(),
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

class BannerMesas extends StatelessWidget {
  //Widget FlatButton({@required String image, @required String prince, @required String name, @required String lastname})
  Widget bottonContainer(
      {@required String image,
      @required String prince,
      @required String name,
      @required String lastname}) {
    var i = 0xff3a3e3e3e;
    return Container(
      height: 270,
      width: 220,
      decoration: BoxDecoration(
        color: Color(i),
        borderRadius: BorderRadius.circular(80),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(image),
            ),
          ),
          Center(
            child: ListTile(
              leading: Text(
                name,
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: <Widget>[
                ListTile(
                  leading: Text(
                    lastname,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Text(
                    prince,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double estado = 0;
    return Scaffold(
      body: Flexible(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 510,
                child: GridView.count(
                  shrinkWrap: false,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    bottonContainer(
                      image: 'images/mesa.png',
                      name: 'Mesa 1',
                      lastname: 'Estado',
                      prince: 'Disponible',
                    ),
                    bottonContainer(
                      image: 'images/mesa.png',
                      name: 'Mesa 2',
                      lastname: 'Estado',
                      prince: 'Disponible',
                    ),
                    bottonContainer(
                      image: 'images/mesa.png',
                      name: 'Mesa 3',
                      lastname: 'Estado',
                      prince: 'Disponible',
                    ),
                    bottonContainer(
                      image: 'images/mesa.png',
                      name: 'Mesa 4',
                      lastname: 'Estado',
                      prince: 'Disponible',
                    ),
                    bottonContainer(
                      image: 'images/mesa.png',
                      name: 'Mesa 5',
                      lastname: 'Estado',
                      prince: 'Disponible',
                    ),
                    bottonContainer(
                      image: 'images/mesa.png',
                      name: 'Mesa 6',
                      lastname: 'Estado',
                      prince: 'Disponible',
                    ),
                    bottonContainer(
                      image: 'images/mesa.png',
                      name: 'Mesa 7',
                      lastname: 'Estado',
                      prince: 'Disponible',
                    ),
                    bottonContainer(
                      image: 'images/mesa.png',
                      name: 'Mesa 8',
                      lastname: 'Estado',
                      prince: 'Disponible',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
