import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooka_tienda/pages/configuracion_page.dart';
import 'package:hooka_tienda/pages/login_page.dart';
import 'package:hooka_tienda/pages/menu_page.dart';
import 'package:hooka_tienda/pages/mesas_page.dart';
import 'package:hooka_tienda/pages/pedido_page.dart';
import 'package:hooka_tienda/pages/productos_page.dart';
import 'package:hooka_tienda/pages/splash_screen_state.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => SplashScreen(),
        'login': (BuildContext context) => LoginPage(),
        'menu': (BuildContext context) => Menu_Page(),
        'mesas': (BuildContext context) => Mesas_Page(),
        'productos': (BuildContext context) => Productos_Page(),
        'pedidos': (BuildContext context) => Pedidos_Page(),
        'configuraciones': (BuildContext context) => Configuraciones_Page(),
      },
    );
  }
}
