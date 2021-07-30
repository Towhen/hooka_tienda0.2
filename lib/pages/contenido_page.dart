import 'package:flutter/material.dart';

class BannerCentro extends StatefulWidget {
  static const String ROUTE = "/BannerCentral";
  @override
  _BannerCentroState createState() => _BannerCentroState();
}

class _BannerCentroState extends State<BannerCentro> {
  Widget bottonContainer(
      {@override String image, @override int prince, @override String name}) {
    var i = 0xff3a3e3e3e;
    return Flexible(
        child: Container(
      height: 270,
      width: 220,
      decoration: BoxDecoration(
        color: Color(i),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(image),
          ),
          ListTile(
            leading: Text(
              name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            trailing: Text(
              "\$ $prince",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
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
                      image: 'images/hookaima.jpg',
                      name: 'Hooka',
                      prince: 20,
                    ),
                    bottonContainer(
                      image: 'images/savorizanteima.jpg',
                      name: 'Savorizante',
                      prince: 10,
                    ),
                    bottonContainer(
                      image: 'images/niveldenicotinaima.jpg',
                      name: 'Nivel de Nicotina',
                      prince: 10,
                    ),
                    bottonContainer(
                      image: 'images/bebidaisima.jpg',
                      name: 'Bebida',
                      prince: 15,
                    ),
                    bottonContainer(
                      image: 'images/aperitivosima.jpg',
                      name: 'Aperitivos',
                      prince: 5,
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
