import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooka_tienda/Contenidos/paramostrar.dart';
import 'package:hooka_tienda/Contenidos/product.dart';

class BannerCentro extends StatefulWidget {
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
                      name: 'Flavoring',
                      prince: 10,
                    ),
                    bottonContainer(
                      image: 'images/niveldenicotinaima.jpg',
                      name: 'Nicotine level',
                      prince: 10,
                    ),
                    bottonContainer(
                      image: 'images/bebidaisima.jpg',
                      name: 'Drinks',
                      prince: 15,
                    ),
                    bottonContainer(
                      image: 'images/aperitivosima.jpg',
                      name: 'Appetizers',
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

class BannerCentro2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ItemProduct(
              product: product,
            );
          }),
    );
  }
}

class ItemProduct extends StatelessWidget {
  const ItemProduct({Key key, this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    product.name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.overline.copyWith(
                          color: Colors.grey,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('\$${product.price} US'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: FlatButton(
                disabledColor: Colors.blue,
                onPressed: () {},
                child: Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
